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
    @favorite.list = @list
    if @favorite.save
      redirect_to movie_path(@movie)
    else
      render "/movies/show", status: :unprocessable_entity
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @list = @favorite.list
    @favorite.destroy
    redirect_to list_path(@list), status: :see_other
  end

  private

  def favorite_params
    params.require[:favorite].permit(:list_id)
  end
end
