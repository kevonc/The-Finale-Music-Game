class GamesController < ApplicationController
  def index
  end

  def start
    client = Soundcloud.new(:client_id => 'fd18da9af13744f5233916b5025adf02')
    @tracks = client.get('/tracks', :limit => 100, :order => 'created_at')
    @tracks.shuffle!

    # get rid of tracks that have no genre stated
    $tracks_with_genre = []
    @tracks.each do |track|
      if track.genre && track.genre != ''
        $tracks_with_genre << track
      end
    end


    @genre_list = Genre.all
    @genre_list.shuffle!
    @genre_list = @genre_list[0..2]

    @track = $tracks_with_genre.first
    @track_genre = @track.genre.capitalize
  end

  def level
    client = Soundcloud.new(:client_id => 'fd18da9af13744f5233916b5025adf02')
    @id = params[:id].to_i
    @track = $tracks_with_genre[@id]
    @track_genre = @track.genre.capitalize

    @genre_list = Genre.all
    @genre_list.shuffle!
    @genre_list = @genre_list[0..2]

    embed_info = client.get('/oembed', :url => @track.uri)
    @widget = embed_info['html']

    @points = 10
  end

  def score
  end
end
