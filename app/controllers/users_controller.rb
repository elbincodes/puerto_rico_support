class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    set_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def edit
    set_user
    if @user != current_user
      redirect_to users_path(@user), notice: "UNAUTHORIZED ACCESS: This is NOT your account!!!"
    end
  end

  def destroy
    set_user
    # if @user != current_user
    #   redirect_to users_path(@user), notice: "UNAUTHORIZED ACCESS: This is NOT your account!!!"
    # end
    Post.where(user_id: @user.id).destroy_all
    Comment.where(user_id: @user.id).destroy_all
    @user.destroy
    redirect_to root_path, notice: 'Account deleted!'
  end

  def update
    set_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :password, :password_confirmation)
  end

end
