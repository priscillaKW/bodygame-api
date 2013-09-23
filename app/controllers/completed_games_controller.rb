class CompletedGamesController < ApplicationController
  def index
    if user = User.find(params[:user_id])
      @games = user.completed_games

      render json: @games
    else
      render nothing: true, status: :not_found
    end
  end

  def create

  end
end
