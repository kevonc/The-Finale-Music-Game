class GamesController < ApplicationController
  def index
  end

  def level
    client = Soundcloud.new(:client_id => ENV['SOUNDCLOUD_KEY'])
    @current_level = params[:id].to_i

    # Load API query once when game starts at level 1
    if @current_level == 1
      $available_tracks = []
      all_tracks = client.get('/tracks', :limit => 100, :order => 'created_at')
      all_tracks.each do |track|
        if track.genre && track.genre != '' && track.uri != ''
          $available_tracks << track
        end
      end
      $available_tracks.shuffle!
    end

    # Start new or find existing game session
    if @current_level == 1
      @game = Game.create(user_id: current_user.id, points: 15)
    else
      @game = Game.find_all_by_user_id(current_user.id).last
    end

    @current_track = $available_tracks[@current_level]
    @current_track_genre = @current_track.genre.capitalize

    # Grab three different genre types as answer choices, avoid duplicate
    @genre_list = []
    @all_genres = Genre.all.shuffle!
    unless @all_genres.include?(@current_track_genre.capitalize)
      @all_genres[0..2].each do |genre|
        @genre_list << genre
      end
    end

    # Set up embed frame, avoid tracks with 404 error
    begin
      embed_info = client.get('/oembed', :url => @current_track.uri)
    rescue
      @current_track = $available_tracks[@current_level+20]
      embed_info = client.get('/oembed', :url => @current_track.uri)
    end
    @widget = embed_info['html']

    @stop_at_level = 20
  end

  def advance_to_next_level
    current_level = params[:id].to_i
    stop_at_level = 20
    if current_level == stop_at_level
      redirect_to finalscore_path
    else
      next_level = current_level + 1
      redirect_to "/level/#{next_level}"
    end
  end

  def add_points
    game = Game.find_all_by_user_id(current_user.id).last
    game.points += 15
    game.save
    advance_to_next_level
  end

  def finalscore
    @game = Game.find_all_by_user_id(current_user.id).last
  end

  def scoreboard
    @games = Game.order("points DESC").limit(20)
  end
end