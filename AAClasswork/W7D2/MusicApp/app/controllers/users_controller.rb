class UsersController < ApplicationController
    def new 
        @user = User.new
        render :new
    end

    def create 
        @user = User.new(user_params)
        if @user.save!
            log_in(@user)
            redirect_to users_url
        else
            render json: @user.errors.full_messages, status: 404
        end
    end

    def show
        @user = User.find(params(:id))
        if @user 
            render :show
        else 
            render json: @user.errors.full_messages, status: 404
        end

    end

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
