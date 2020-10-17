class UsersController < ApplicationController
    before_action :login_check
    def user_index
        @user = User.find(params[:id])
        @reviews = @user.reviews
        puts @reviews.class
        puts @reviews.length
    end
end
