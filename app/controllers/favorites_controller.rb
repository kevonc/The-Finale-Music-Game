class FavoritesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @favorites = Favorite.find_all_by_user_id(current_user.id)
  end

  def add_fav
    @current_level = params[:id].to_i
    @current_track = $available_tracks[@current_level]

    new_fav = Favorite.create(user_id: current_user.id,
                              track: @current_track.title,
                              url: @current_track.permalink_url,
                              genre: @current_track.genre,
                              uploaded_by: @current_track.user["username"],
                              created: @current_track.created_at,
                              artwork: @current_track.artwork_url,
                              soundcloud_id: @current_track.id)

    redirect_to "/level/#{@current_level}"
  end
end
