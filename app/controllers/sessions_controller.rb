class SessionsController < ApplicationController
    def create 
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id 
            render json: user, status: :created
        else 
            render json: { error: "Invalid username or password" }, status: :unauthorized
        end
    end 

    def show 
        if current_user
            user = User.find_by(id: current_user.id)
            render json: user, status: :ok
        else  
            render json: { error: "Not authorized"}, status: :unauthorized
        end 
    end 

    def destroy 
        session[:user_id] = nil
        head :no_content
    end 

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end 
end 
