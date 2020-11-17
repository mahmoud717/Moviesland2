class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :logged?, only: %i[new create]
  before_action :admin?, only: %i[new create]
  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.includes(image_attachment: :blob).order(created_at: :desc).limit(4)
    @count = 0
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to root_path, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        flash.alert = @category.errors.full_messages
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  def admin?
    if session['current_user']['admin'] == true
      true
    else
      redirect_to root_path, notice: "HaHaHa nice try, unfortunally you can't Create, Edit or Delete any categories."
    end
  end

  def logged?
    session.key?('current_user') ? true : redirect_to(login_path)
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name)
  end
end
