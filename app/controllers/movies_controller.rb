class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @favorite = Favorite.new
    @lists = List.all
  end
end
