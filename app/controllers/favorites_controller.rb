class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @favorite = Favorite.new(favorite_params)
    @favorite.movie = @movie
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @list = @favorite.list
    @favorite.destroy
    redirect_to list_path(@list)
  end

  private

  def favorite_params
    params.require[:favorite].permit(:list)
  end
end
