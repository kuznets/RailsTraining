class CommentsController < ApplicationController

  # http_basic_authenticate_with name: "admin", password: "admin", only: :destroy
  before_action :authenticate_user!, :only => [:destroy]

  def create
    @article = Article.find(params[:article_id])
    logger.debug "@ARTICLE VAL: #{@article.attributes.inspect}"
    @comment = @article.comments.create!(comment_params)
    logger.debug "@COMMENT PARAMS: #{comment_params.inspect}"
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id)
  end
end