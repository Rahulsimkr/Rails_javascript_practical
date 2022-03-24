class UsersController < ApplicationController
  before_action :find_user, only: %i[ show edit update destroy user_profile update_profile change_password update_password ]

  def index
    @users = User.order(created_at: :desc)
    @user = User.new
  end

  def create
    @user = User.new(user_param)
    if @user.save
      respond_to do |format|
        flash[:notice] = "User is successfully created....👍"
        format.js
      end
    else
      respond_to do |format|
        flash[:notice] = "something went wrong....👍"
        format.js
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user_data = User.find_by_id(@user)
    @user.update(user_param)
    if @user.valid?
      respond_to do |format|
        flash[:notice] = "Profile updated successfully"
        format.js
      end
    else
      respond_to do |format|
        flash[:errors] = @user.errors.full_messages
        format.js
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def change_password
    @user = User.find(params[:id])
  end

  def password_update
    @user = User.find(params[:id])
    if @user.update_attribute(:password, params[:new_password])
      flash[:notice] = "Password was changed successfully."
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to password_update_user_path(@user)
    end
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def check_password
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_param
    params.require(:user).permit(:first_name, :last_name, :email, :password, :confirm_password, :subscription, :subscription_email)
  end
end
