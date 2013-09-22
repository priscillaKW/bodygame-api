class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    render json: @user
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
end
