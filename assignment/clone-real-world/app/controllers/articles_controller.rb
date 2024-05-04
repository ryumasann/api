class ArticlesController < ApplicationController
  def index
    @articles = Article.limit(10)
    # @articles = Article.joins(:tags).includes(:tags).limit(10)
    puts @articles.to_sql
    @tags = Tag.limit(10)
    puts @tags.to_sql
  end

  def show
    # @article = Article.includes(:tag)
    # @article = Article.find_by(id: params[:id])
    @article = Article.find_by(slug: params[:slug])
    # @article = Article.includes(:tag).find_by(slug: params[:slug])
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
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to articles_url
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :body, tag_ids: [])
  end
end
