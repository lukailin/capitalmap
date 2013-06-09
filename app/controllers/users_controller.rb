class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user
      respond_to do |format|
        format.html
      end
    else
      redirect_to root_url
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.save
      session[:user_id] = @user.id
      current_user = @user
      redirect_to @user
    else
      redirect_to root_url, notce: "Errors detected."
    end
  end

  def save_password
    @user = User.find()
  end
end