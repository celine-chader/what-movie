class MoviesController < ApplicationController
  def index
    if params[:query].present?
      @movies = Movie.search_by_title_and_director(params[:query])
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @favorite = Favorite.new
    @lists = List.all
  end

  def random
    @movies = Movie.all
    @movies.sample = @movie
    redirect_to movie_path(@movie)
  end
end
