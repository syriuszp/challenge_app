class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!, only: [:show, :index]

  def index
    @users = User.order(points: :desc)
  end

  def show
  end

  def create
    @user = User.create( user_params )
  end

  private

	  # Use strong_parameters for attribute whitelisting
	  # Be sure to update your create() and update() controller methods.

	  def user_params
	    params.require(:user).permit(:avatar)
	  end

    def set_user
      @user = User.find(params[:id])
    end
end
