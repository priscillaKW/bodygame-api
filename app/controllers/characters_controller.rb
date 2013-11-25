class CharactersController < ApplicationController
  def create
    @user = User.find(params[:user_id])

    if @user
      @character = @user.character || Character.new

      @character.kind = params[:character][:kind]

      if @character.valid?
        @user.character = @character

        render json: @user, status: :created
      else
        render json: @character.errors, status: :unprocessable_entity
      end
    else
      render nothing: true, status: :not_found
    end
  end

  def update
    @user = User.find(params[:user_id])

    if @user && @user.character
      @user.character.current_stage = params[:character][:current_stage]

      if @user.save
        render json: @user, status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      render nothing: true, status: :not_found
    end
  end
end
