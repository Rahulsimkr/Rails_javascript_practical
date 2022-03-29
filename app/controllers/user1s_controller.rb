class User1sController < ApplicationController
  before_action :find_user1, only: %i[show edit update destroy]

  def index
    @user1s = User1.all
  end

  def show
  end

  def new
    @user1 = User1.new
  end

  def edit
  end

  def create
    @user1 = User1.new(user1_params)
    if @user1.save
      User1Mailer.with(user1: @user1).welcome_email.deliver_later
      flash[:notice] = "User successfully created"
      redirect_to user1s_path
    else
      flash[:notice] = "Something went wrong"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user1.update(user1_params)
      User1Mailer.with(user1: @user1).edit_email.deliver_later
      flash[:notice] = "User successfully created"
      # redirect_to = "User successfully created"
      redirect_to user1s_path
    else
      flash[:alert] = "Something went wrong"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user1.destroy
    redirect_to user1s_path
    flash[:notice] = "Successfully dleted"
  end

  private

  def find_user1
    @user1 = User1.find_by_id(params[:id])
  end

  def user1_params
    params.require(:user1).permit(:name, :email, picture: [])
  end
end
