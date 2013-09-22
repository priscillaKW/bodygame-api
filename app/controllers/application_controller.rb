class ApplicationController < ActionController::API
  include ActionController::ParamsWrapper

  wrap_parameters format: [:json]
end
