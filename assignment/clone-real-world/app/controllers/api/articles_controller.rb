class Api::ArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token
  # single_article = { article: { slug: @article.slug, title: @article.title, description: @article.description,
  #                               body: @article.body, tagList: %w[dragons training], createdAt: @article.created_at, updatedAt: @article.updated_at, favorited: false, favoritesCount: 0, author: { username: 'jake', bio: 'I work at statefarm', image: 'https://i.stack.imgur.com/xHWG8.jpg', following: false } } }
  def index
    @articles = Article.limit(10)
    # @articles = Article.joins(:tags).includes(:tags).limit(10)
    @tags = Tag.limit(10)
  end

  def show
    @article = Article.find_by(slug: params[:slug])
    render json: { article: { slug: @article.slug, title: @article.title, description: @article.description, body: @article.body,
                              tagList: %w[dragons training], createdAt: @article.created_at, updatedAt: @article.updated_at, favorited: false, favoritesCount: 0, author: { username: 'jake', bio: 'I work at statefarm', image: 'https://i.stack.imgur.com/xHWG8.jpg', following: false } } }
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      # render json: { article: { title: @article.title, description: @article.description, body: @article.body,
      #                           tagList: @article.tags } }
      render json: { article: { slug: @article.slug, title: @article.title, description: @article.description, body: @article.body,
                                tagList: %w[dragons training], createdAt: @article.created_at, updatedAt: @article.updated_at, favorited: false, favoritesCount: 0, author: { username: 'jake', bio: 'I work at statefarm', image: 'https://i.stack.imgur.com/xHWG8.jpg', following: false } } }
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
      render json: { article: { slug: @article.slug, title: @article.title, description: @article.description, body: @article.body,
                                tagList: %w[dragons training], createdAt: @article.created_at, updatedAt: @article.updated_at, favorited: false, favoritesCount: 0, author: { username: 'jake', bio: 'I work at statefarm', image: 'https://i.stack.imgur.com/xHWG8.jpg', following: false } } }
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
