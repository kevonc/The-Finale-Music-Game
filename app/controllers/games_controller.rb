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
    end

    # Start new or find existing game session
    unless @current_level == 1
      @game = Game.find_all_by_user_id(current_user.id).last
    else
      @game = Game.create(user_id: current_user.id, points: 15)
    end

    # Setting current track's info
    # begin
      @current_track = $available_tracks[@current_level]
    # rescue
    #   @current_track = $available_tracks[@current_level+20]
    # end

    @current_track_genre = @current_track.genre.capitalize

    # Grab three different genre types as answer choices, avoid duplicate
    @genre_list = []
    @all_genres = Genre.all.shuffle!
    unless @all_genres.include?(@current_track_genre.capitalize)
      @all_genres[0..2].each do |genre|
        @genre_list << genre
      end
    end

    # @genre_list = Genre.all.shuffle!.first(3) ###################### Need to find current genre and avoid duplicate

    # Set up embed frame
    begin
      embed_info = client.get('/oembed', :url => @current_track.uri)
    rescue
      @current_track = $available_tracks[@current_level+20]
      embed_info = client.get('/oembed', :url => @current_track.uri)
    end
    @widget = embed_info['html']

    unless embed_info
      @next_level = @current_level + 1
      redirect_to "/level/#{@next_level}"
    end

    @stop_at_level = 20
  end

  def add_points
    @game = Game.find_all_by_user_id(current_user.id).last
    @game.points += 15
    @game.save
    # sleep(3)
    @current_level = params[:id].to_i
    @stop_at_level = 20
    if @current_level == @stop_at_level
      redirect_to score_path
    else
      @next_level = @current_level + 1
      redirect_to "/level/#{@next_level}"
    end
  end

  def progress
    # sleep(3)
    @current_level = params[:id].to_i
    @stop_at_level = 20
    if @current_level == @stop_at_level
      redirect_to score_path
    else
      @next_level = @current_level + 1
      redirect_to "/level/#{@next_level}"
    end
  end

  def score
    @end_game = Game.find_all_by_user_id(current_user.id).last
  end

  def scoreboard
    @games = Game.order("points DESC").limit(20)
  end
end
