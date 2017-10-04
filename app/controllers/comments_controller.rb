class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def show
    set_comment
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_path(current_post), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def edit
    set_comment
  end

  def destory
    set_comment
    @comment.destroy
    redirect_to posts_path, notice: 'Comment deleted!'
  end

  def update
    set_comment
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post), notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id, :organization_id)
  end

  def current_post
    Post.find_by_id(comment_params[:post_id])
  end

end
