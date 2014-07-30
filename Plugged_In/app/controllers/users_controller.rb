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

  def edit
    @user = User.find(params[:id])
  end
    
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Your details were successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @user = User.create(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_profile_path, notice: "Signed up! Now create your profile"
    else
      render :new
    end
  end
end
