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

  #function for article edit
  def edit
      @article = Article.find(params[:id])
  end

  #function for article update, with redirect to edit, if returning errors
  def update
      @article = Article.find(params[:id])

      if @article.update(article_params)
          redirect_to @article
      else
          render :edit
      end
  end

  private
    def article_params
        params.require(:article).permit(:title, :body)
    end

end
