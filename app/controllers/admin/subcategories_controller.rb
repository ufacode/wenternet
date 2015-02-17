class Admin::SubcategoriesController < Admin::ApplicationController
  before_action :set_subcategory, only: [:edit, :update, :destroy]

  # GET /subcategories
  def index
    @subcategories = Subcategory.all
  end

  # GET /subcategories/new
  def new
    @subcategory = Subcategory.new
  end

  # GET /subcategories/1/edit
  def edit
  end

  # POST /subcategories
  def create
    @subcategory = Subcategory.new(subcategory_params)

    if @subcategory.save
      redirect_to admin_subcategories_path, notice: 'Subcategory was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /subcategories/1
  def update
    if @subcategory.update(subcategory_params)
      redirect_to admin_subcategories_path, notice: 'Subcategory was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /subcategories/1
  def destroy
    @subcategory.destroy
      redirect_to admin_subcategories_url, notice: 'Subcategory was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subcategory
      @subcategory = Subcategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subcategory_params
      params.require(:subcategory).permit(:name, :uri, :category_id)
    end
end
