class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    # raise params.inspect
    @article = Article.find(params[:id])
      if @article.update(title: params[:article][:title], description: params[:article][:description])
        flash[:success] = "Article was successfully updated"
        redirect_to @article
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  
  
end
