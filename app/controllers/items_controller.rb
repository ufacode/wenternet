class ItemsController < ApplicationController
  load_and_authorize_resource

  before_action :set_item,   only: [:show, :edit, :update, :destroy, :plus_rating, :minus_rating]
  before_action :set_params, only: [:city, :category, :subcategory]

  def index
    @items = Item.includes(category: :subcategories).includes(:city).pages(params[:page]).all
  end

  def show
    @categories = Category.all
    # TODO: Refactor this
    @recent_items = Item.where(category: @item.category).newest.published.limit(5)
  end

  def new
    @item = Item.new
  end

  def edit; end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      unless params[:images].nil?
        params[:images]['attachment'].each do |attch|
          @image = @item.images.create!(attachment: attch)
        end
      end
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      unless params[:images].nil?
        @item.images.delete_all
        params[:images]['attachment'].each do |attch|
          @image = @item.images.create!(attachment: attch)
        end
      end
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  def city
    @items = Item.newest.published.pages(params[:page])
    items_city!
  end

  def category
    @items = Item.newest.published.pages(params[:page]).where(category: @category)
    items_city!
  end

  def subcategory
    @items = Item.where(category: @category, subcategory: @subcategory).newest.published.pages(params[:page])
    items_city!
  end

  def plus_rating
    rate!(1)
  end

  def minus_rating
    rate!(-1)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_params
    @categories  = Category.includes(:subcategories)
    @city        = City.where(uri: params[:city]).first if params[:city]
    @category    = Category.where(uri: params[:category]).first if params[:category]
    @subcategory = Subcategory.where(category: @category,
                                     uri: params[:subcategory]).first if params[:subcategory]
  end

  def items_city!
    @items = @items.where(city: @city) unless all_cities?
  end

  def item_params
    params.require(:item).permit(:title, :price, :content, :category_id, :subcategory_id, :city_id, :user_id,
                                 :email, :phone, :state, images_attributes: [:id, :item_id, :attachment])
  end

  def all_cities?
    @city = 'all' if params[:city].downcase == 'all'
  end

  def rate!(rating)
    if Rating.dublicate?(@item, current_user)
      @message = 'You have already voted'
    else
      @item.user.rate!(@item, current_user, rating)
      @message = 'Your vote has been counted'
    end
  end
end
