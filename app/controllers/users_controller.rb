class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You've successfully signed up!"
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:alert] = 'There was a problem signing up'
      redirect_to users_path
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update(user_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    @user.destroy
    session[:user_id] = nil
    redirect_to '/signin'
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :image)
  end

end
