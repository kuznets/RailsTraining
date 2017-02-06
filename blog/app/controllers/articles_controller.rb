class ArticlesController < ApplicationController

  # http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]
  #Devise authenticate rules
  before_action :authenticate_user!, :except => [:index, :show]

  #GET /articles
  def index
    @article = Article.all
  end

  #GET /articles/1
  def show
    @article = Article.find(params[:id])
  end

  #GET /articles/new
  def new
    @article = Article.new
  end

  #GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  #POST /articles
  def create
    #@article = current_user.articles.new(article_params)
    @article = current_user.article.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Post was successfully created.'
    else
      render 'new'
    end
  end

  #PUT /articles/1
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article, notice: 'Post was successfully updated.'
    else
      render 'edit'
    end
  end

  #DELETE /articles/1
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path, notice: "Delete"
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
