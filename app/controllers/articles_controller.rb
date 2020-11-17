class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :logged?, only: %i[edit update destroy create new]
  before_action :user?, only: %i[edit update destroy]
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all.includes(image_attachment: :blob)
    @main_article = Article.order(vote_counter: :desc).first

    @categories = Category.all
  end

  # GET /articles/1
  # GET /articles/1.json

  # GET /articles/new
  def new
    @article = Article.new
    @categories = Category.all
  end

  # GET /articles/1/edit
  def edit
    @categories = Category.all
  end

  # POST /articles
  # POST /articles.json
  def create
    @user = User.find(session['current_user']['id'])
    @article = @user.articles.new(article_params)
    @article.vote_counter = 0
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      flash.alert = @article.errors.full_messages
      render :new

    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  def user?
    if @article.user.id == session['current_user']['id'] || session['current_user']['admin'] == true
      true
    else
      redirect_to root_path, notice: "HaHaHa nice try, unfortunally you can't edit or delete another user's Article."
    end
  end

  def logged?
    if session.key?('current_user')
      true
    else
      redirect_to(login_path, notice: 'You have to Login to be able to create an article.')
    end
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:author_id, :title, :body, :image, :category_id)
  end
end
