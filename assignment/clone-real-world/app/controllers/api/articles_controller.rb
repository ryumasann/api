class Api::ArticlesController < ApplicationController
  def index
    @articles = Article.limit(10)
    # @articles = Article.joins(:tags).includes(:tags).limit(10)
    @tags = Tag.limit(10)
  end

  def show
    @article = Article.find_by(slug: params[:slug])
    puts @article
    puts Article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    p @article
    if @article.save
      flash[:success] = '投稿完了'
      redirect_to articles_url
      # redirect_to article_url(@article.slug)
      # redirect_to article_url(@article.slug)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find_by(slug: params[:slug])
  end

  def update
    @article = Article.find_by(slug: params[:slug])

    if @article.update(article_params)
      redirect_to articles_url
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    article = Article.find_by(slug: params[:slug])
    article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :body, tag_ids: [])
  end
end
