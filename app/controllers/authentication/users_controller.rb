class Authentication::UsersController < ApplicationController
    def new
        @user = User.new
    end

    def index
        @user = User.all
        render json: @user
    end

    def create
        @user = User.new(user_params)
        @user['password_digest'] = params[:password]
        if @user.save
            render json: @user, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :username, :password, :password_digest, :password_confirmation)
    end
end