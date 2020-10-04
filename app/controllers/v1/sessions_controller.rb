class V1::SessionsController < ApplicationController
    def index
    end

    def create
        @user = User.where(email: params[:email]).first
        
        if @user&.valid_password?(params[:password])
            render :create, status: :created
        else
            head(:unauthorized)
        end
        # user =  User.create(session_params)
        # render json: user, status: :created
    end

    def destroy
        
    end

    private 
    def session_params
        params.permit(:email,:password,:password_confirmation)
    end

end