class GamesController < ApplicationController
  def index
    if organ = Organ.find(params[:organ_id])

      if params[:type]
        @games = organ.games.where(_type: params[:type]).entries
      else
        @games = organ.games.entries
      end

      render json: @games
    else
      render nothing: true, status: :not_found
    end
  end

  def show
    if @game = Game.find(params[:id])
      render json: @game
    else
      render nothing: true, status: :not_found
    end
  end
end
