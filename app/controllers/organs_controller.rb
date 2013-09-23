class OrgansController < ApplicationController
  def index
    @organs = Organ.all.entries

    render json: @organs
  end

  def show
    @organ = Organ.find(params[:id])

    if @organ
      render json: @organ
    else
      render nothing: true, status: :not_found
    end
  end
end
