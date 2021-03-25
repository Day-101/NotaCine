class ArticlesController < ApplicationController
before_action :redirect_if_not_admin, except: [:index, :show]

  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params)
    if article.save
      flash.notice = " Article successfully updated"
      redirect_to article_path(article)
    else
      flash.alert = article.errors.full_messages.to_sentence
      redirect_to edit_article_path(article)
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    flash.notice = "Article removed"
    redirect_to articles_path
  end

  def create
    article = Article.new(article_params)
    article.user = current_user
    if article.save
      flash.notice = " Article successfully created"
      redirect_to article_path(article)
    else
      flash.alert = article.errors.full_messages.to_sentence
      redirect_to "/admin"
    end
  end

  def show
    @article = Article.find(params[:id])

  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :lead, :article_picture)
  end

end
