class LoginsController < ApplicationController
  def login
    @login = Login.find_by_username(params[:login][:username])

    if @login
      if @login.verify_password(params[:login][:password])
        render json: @login.user
      else
        unauthorized({ password: "doesn't match" })
      end
    else
      unauthorized({ username: "doens't exists"})
    end
  end

  private

  def unauthorized(reason)
    render json: reason, status: :unauthorized
  end
end
