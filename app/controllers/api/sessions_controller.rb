class Api::SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        @user = User.find_by_credentials(
            params[:user][:email], 
            params[:user][:password]
        )

        if @user.nil?
            render json: ["Oops! We don't recognize that email and password combination. Please try again."], status: 401
        else
            login(@user)
            render 'api/users/show'
        end
    end

    def destroy
        if logged_in?
            logout
            render json: {}
        else
            render json: ['Page not found.'], status: 404
        end
    end
end