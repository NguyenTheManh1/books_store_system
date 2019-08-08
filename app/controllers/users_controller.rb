class UsersController < ApplicationController
  def index; end

  def new
    @user = User.new
  end

  def show; end

  def edit; end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "signup_suc"
      redirect_to root_url
    else
      flash[:danger] = t "danger"
      render :new
    end
  end

  def update; end

  def destroy; end

  private

  def user_params
    params.require(:user).permit :name, :email, :address, :phone, :password,
      :password_confirmation
  end
end
