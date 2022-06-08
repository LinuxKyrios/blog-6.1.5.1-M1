class ArticlesController < ApplicationController
  #function for index page with all articles list
  def index
      @articles = Article.all
  end

  #function for showing chosen article
  def show
      @article = Article.find(params[:id])
  end

  #function for new article
  def new
      @article = Article.new
  end

  #function for creating new article
  def create
      @article = Article.new(article_params)

      if @article.save
          redirect_to @article
      else
          render :new
      end
  end

  private
    def article_params
        params.require(:article).permit(:title, :body)
    end

end
