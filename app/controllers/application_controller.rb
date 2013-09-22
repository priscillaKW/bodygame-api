class ApplicationController < ActionController::API
  include ActionController::ParamsWrapper

  wrap_parameters format: [:json]

  rescue_from ActiveRecord::RecordNotFound do
    render(nothing: true, status: :not_found)
  end
end
