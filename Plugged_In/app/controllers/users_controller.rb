class UsersController < ApplicationController
 
  before_filter :authenticate_user!, only: :index

  def index
    @users = User.all
    authorize! :index, User
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    authorize! :show, @user
  end

  def create
    @user = User.create(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Signed up!"
    else
      render :new
    end
  end
end