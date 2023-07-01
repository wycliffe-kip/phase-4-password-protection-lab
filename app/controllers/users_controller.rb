class UsersController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_record_not_valid_response
rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response
    
    def create 
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    def show 
        user = User.find_by(user_id: params[:user_id])
        render json: user, status: :ok
    end 

    private 

    def user_params 
        params.permit(:username, :password, :password_confirmation)
    end 

    def render_record_not_valid_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end 

    def render_record_not_found_response 
        render json: { error: "User not found" }, status: :not_found
    end 
end
