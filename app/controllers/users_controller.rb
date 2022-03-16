class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:notice] = "User is successfully created 👍"
      redirect_to users_path
    else
      flash[:notice] = "Something went wrong 👍"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user = User.update(user_params)
      flash[:notice] = "User  successfully edited 👍"
      redirect_to users_path
    else
      render :edit, status: :unprocessable_entity
      flash[:notice] = "Something went wrong 👍"
    end
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to users_path
    flash[:notice] = "User has been successfully deleted 💬"
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :subscription_email)
  end
end
