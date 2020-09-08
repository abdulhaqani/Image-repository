class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :same_user_users, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @images = @user.images.paginate(page: params[:page], per_page: 12)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'Welcome to the Image repository, you are now registered'
      redirect_to images_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Account was successfully updated'
      redirect_to images_path
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end