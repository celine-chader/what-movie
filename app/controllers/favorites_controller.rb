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
    @list = @favorite.list
    if @favorite.save
      redirect_to movie_path(@movie), notice: "This movie was added to the list !"
    else
      render "/movies/show", status: :unprocessable_entity
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to list_path(@favorite.list), status: :see_other
  end

  private

  def favorite_params
    params.require(:favorite).permit(:list_id)
  end
end
