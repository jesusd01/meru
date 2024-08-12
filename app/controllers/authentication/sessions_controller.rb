class Authentication::SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        # # @user = User.find(3)
        # # @user.destroy
        # # render json: @user
        # if @user.authenticate(params[:password])
        if params[:password] == @user[:password_digest]
            render json: @user
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end
end