class Admin::CategoriesController < Admin::ApplicationController
  def new
    @page_title = 'Add Category'
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = 'Category Created'
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def index
    @categories = Category.all
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      flash[:notice] = 'Category Updated'
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    if @category.update(category_params)
      flash[:notice] = 'Category Deleted'
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def show
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end


end
