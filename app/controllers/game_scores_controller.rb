class GameScoresController < ApplicationController
  def create
    @score = GameScore.new(params[:game_score].merge(user_id: params[:user_id]))

    if @score.save
      render json: @score, status: :created, location: @score
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  def show
    @score = GameScore.find(params[:id])

    if @score
      render json: @score
    else
      render nothing: true, status: :not_found
    end
  end

  def index
    if user = User.find(params[:user_id])
      @scores = user.game_scores.entries
      render json: @scores
    else
      render nothing: true, status: :not_found
    end
  end
end
