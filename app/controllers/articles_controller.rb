class ArticlesController < ApplicationController
  before_action :find_article, only: %i[show edit update destroy]
  def home
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def create
    Article.create(article_params)
    redirect_to articles_path
  end

  def new
    @article = Article.new
  end

  def show; end

  def edit; end

  def update
    @article.update(article_params)
    redirect_to articles_path
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
