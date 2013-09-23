class StudiesController < ApplicationController
  def index
    if organ = Organ.find(params[:organ_id])
      @studies = organ.studies

      render json: @studies
    else
      render nothing: true, status: :not_found
    end
  end

  def show
    if @study = Study.find(params[:id])
      render json: @study
    else
      render nothing: true, status: :not_found
    end
  end
end
