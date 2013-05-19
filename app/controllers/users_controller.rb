class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    if session[:user_id] != @user.id
      redirect_to users_url, notice: "this is not you"
    end
  end

  def new
    @user = User.new
    # this is so if a new user signs up they aren't redirected to sign in again
    @user.username = params[:username]
    @user.password = params[:password]


  end

  def create
    @user = User.new
    @user.username = params[:username]
    @user.password = params[:password]

    if @user.save
            redirect_to users_url
          else
      render 'new'
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
    if session[:user_id] != @user.id
      redirect_to users_url, notice: "you can't edit this"
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.username = params[:username]
    @user.password = params[:password]

    if @user.save
            redirect_to users_url
          else
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
        redirect_to users_url
      end
end
