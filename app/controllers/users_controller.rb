class UsersController < ApplicationController
    before_action :login_check
    def user_index
        @user = User.find(params[:id])
        @reviews = Review.where('user_id': current_user.id)
        puts @reviews.class
        puts @reviews.length
    end
end
