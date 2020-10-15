class ReviewsController < ApplicationController
    before_action :login_check 
    skip_before_action :verify_authenticity_token

    def create
        review = Review.new
        review.score = params[:review]['score']
        review.des = params[:review]['des']
        review.user_id = current_user.id
        review.movie_id = params[:review]['mov_id']
        @movie = Movie.find(params[:review]['mov_id'])

        #VALIDATION BEFORE SAVE
        if params[:score] != '-'
            @ok = 1
            review.save
            @movie.avg_score_cal()
        else
            @ok = 0
        end
        respond_to do |format|
            format.js
        end
    end

    def edit    #get /reviews/:id/edit
        @review = Review.find(params[:id])
        @movie = Movie.find(params[:mov_id])
        @from = params[:from]
    end

    def update  #post /reviews/update/:id
        if params[:review]['score'] != '-'
            review = Review.find(params[:id])
            user_id = review.user_id.to_s
            review.score = params[:review]['score']
            review.des = params[:review]['des']
            review.save
            flash.notice = "Review updated."
            if params['from'] == "user_index"
                redirect_to '/users/'+user_id
            else
                redirect_to movie_path(params[:mov_id])
            end
        else
            respond_to do |format|
                format.js 
            end
        end
    end

    def destroy  #delete /reviews/:id
        review = Review.find(params[:id])
        user_id = review.user_id.to_s
        review.destroy

        movie = Movie.find(params[:mov_id])
        movie.avg_score_cal()

        flash.notice = "Review deleted."
        if params['from'] == "user_index"
            redirect_to '/users/'+user_id
        else
            redirect_to movie_path(movie)
        end
    end
end
