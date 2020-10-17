class MoviesController < ApplicationController
  before_action :login_check, except: [:index, :partialGet, :show, :search]
  skip_before_action :verify_authenticity_token
  

  def index
    @movies = Movie.order("name ASC")
  end

  def partialGet 
    if params[:re]['1'] != "" && params[:re]['2'] != "" && params[:rat].length != 0
      @movies = Movie.where('rat': params[:rat], 're': Date.parse(params[:re]['1'])..Date.parse(params[:re]['2'])).order("name ASC").order("name ASC")
    elsif params[:rat].length != 0
      @movies = Movie.where('rat': params[:rat]).order("name ASC")
    else
      @movies = Movie.where('rat': "lol")
    end
    
    respond_to do |format|
      format.js 
    end
  end


  def tmdb_new
    Tmdb::Api.key("39cb0ff314f3beb99b9bda749e42305c")
    Tmdb::Api.language("en")

    movie = Tmdb::Movie.detail(params[:id].to_i)
    
    gen = ""
    movie['genres'].each_with_index do |e, i|
        if i == movie['genres'].length-1
            gen += e['name']
        else
            gen += e['name']+", "
        end
    end
    
    @name = movie['title']
    @re = movie['release_date']
    @gen = gen
    @len = movie['runtime']
    @des = movie['overview']
  end

  def tmdb_search  
    Tmdb::Api.key("39cb0ff314f3beb99b9bda749e42305c")
    Tmdb::Api.language("en")

    search = Tmdb::Search.new
    search.resource('movie')
    search.query(params[:key])
    @result = search.fetch

    @result.each do |i|
        puts i['original_title'].to_s+"  "+i['release_date'].to_s

    end
    
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
  end

  def create
    movie = Movie.new
    movie.name = params[:movie]['name']
    movie.rat = params[:movie]['rat']
    movie.re = params[:movie]['re']
    movie.gen = params[:movie]['gen']
    movie.len = params[:movie]['len']
    movie.des = params[:movie]['des']
    movie.avg_score = 0
    if !(movie.same_check()) and (movie.valid?)
      movie.save
      flash.notice = "Movie added."
      redirect_to movie_path(movie)
    else
      respond_to do |format|
        format.js 
      end
    end
    
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    movie.name = params[:movie]['name']
    movie.rat = params[:movie]['rat']
    movie.re = params[:movie]['re']
    movie.gen = params[:movie]['gen']
    movie.len = params[:movie]['len']
    movie.des = params[:movie]['des']
    if (movie.valid?)
      movie.save
      flash.notice = "Movie updated."
      redirect_to movie_path(movie)
    else
      respond_to do |format|
        format.js 
      end
    end
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    flash.notice = "Movie deleted."
    redirect_to movies_path
  end

end
