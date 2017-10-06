class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    set_post
    @verified = (@post.user == current_user)
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if current_organizations
      @post.organization = Connection.where(user_id: current_user.id, organization_id: params[:post][:organization_id], admin: true).first.organization
    end
    if @post.save
      redirect_to post_path(@post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
    set_post
    if @post.user != current_user
      redirect_to post_path(@post), notice: "UNAUTHORIZED ACCESS: This is NOT your post!!!"
    end
  end

  def destroy
    set_post
    # if @post.user != current_user
    #   redirect_to posts_path(@post), notice: "UNAUTHORIZED ACCESS: This is NOT your post!!!"
    # end
    @post.destroy
    redirect_to posts_path, notice: 'Post deleted!'
  end

  def update
    set_post
    if @post.update(post_params) && @post.user_id == current_user.id
      redirect_to post_path(@post), notice: 'Post was successfully updated.'
    elsif @post.user_id != current_user.id
      redirect_to post_path(@post), notice: 'Post can only be updated by author.'
    else
      render :edit
    end
  end



  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :organization_id)
  end

  # def get_organization
  #   Organization.find_by_id(post_params[:organization_id])
  # end

end
