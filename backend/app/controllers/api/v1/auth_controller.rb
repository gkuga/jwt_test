class Api::V1::AuthController < ApplicationController  
  def login
    user=User.find(params[:id])
    request.env['warden'].set_user(user)
    p request.env['warden'].user
    render json: user.attributes.slice('token')
  end
end  
