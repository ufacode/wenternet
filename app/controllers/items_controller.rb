class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  def index
    @items = Item.all
  end

  # GET /items/1
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  def create
    @item = Item.new(item_params)
    if @item.save
      unless params[:images].nil?
        params[:images]["attachment"].each do |attch|
          @image = @item.images.create!(attachment: attch)
        end
      end
      redirect_to @item, notice: "Item was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      unless params[:images].nil?
        @item.images.delete_all
        params[:images]["attachment"].each do |attch|
          @image = @item.images.create!(attachment: attch)
        end
      end
      redirect_to @item, notice: "Item was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    redirect_to items_url, notice: "Item was successfully destroyed."
  end

  # GET /ufa
  def city
    @categories = Category.all
    if all_cities(params[:city_uri])
      @items = Item.all.by_desc.page params[:page]
    else
      city = City.where(uri: params[:city_uri]).first
      @items = Item.where(city: city).by_desc.page params[:page]
    end
  end

  # GET /ufa/auto
  def category
    @category = Category.where(uri: params[:category_uri]).first
    if all_cities(params[:city_uri])
      @items = Item.where(category: @category).by_desc.page params[:page]
    else
      city = City.where(uri: params[:city_uri]).first
      @items = Item.where(city: city, category: @category).by_desc.page params[:page]
    end
  end

  # GET /ufa/auto/sell
  def subcategory
    category = Category.where(uri: params[:category_uri]).first
    subcategory = Subcategory.where(uri: params[:subcategory_uri]).first
    if all_cities(params[:city_uri])
      @items = Item.where(category: category, subcategory: subcategory).by_desc.page params[:page]
    else
      city = City.where(uri: params[:city_uri]).first
      @items = Item.where(city: city, category: category, subcategory: subcategory).by_desc.page params[:page]
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:title, :price, :content, :category_id, :subcategory_id, :city_id, :user_id,
                                 :email, :phone, :state, images_attributes: [:id, :item_id, :attachment])
  end

  def all_cities(city_param)
    city_param.downcase == "all"
  end
end
