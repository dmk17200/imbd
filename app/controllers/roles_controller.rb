class RolesController < ApplicationController

  def index
    if session[:user_id].present?
      @roles = Role.all
     else
      redirect_to new_session_url, notice: "Sign in to see roles"
    end
  end

  def show
    if session[:user_id].present?
      @role = Role.find_by_id(params[:id])
    else
      redirect_to new_session_url, notice: "Sign in to see roles"
    end
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new
    @role.character_name = params[:character_name]
    @role.actor_id = params[:actor_id]
    @role.movie_id = params[:movie_id]

    if @role.save
            redirect_to roles_url
          else
      render 'new'
    end
  end

  def edit
    @role = Role.find_by_id(params[:id])
  end

  def update
    @role = Role.find_by_id(params[:id])
    @role.character_name = params[:character_name]
    @role.actor_id = params[:actor_id]
    @role.movie_id = params[:movie_id]

    if @role.save
            redirect_to roles_url
          else
      render 'edit'
    end
  end

  def destroy
    @role = Role.find_by_id(params[:id])
    @role.destroy
        redirect_to roles_url
      end
end
