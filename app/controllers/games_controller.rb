class GamesController < ApplicationController
  def index
  end

  def level
    client = Soundcloud.new(:client_id => 'fd18da9af13744f5233916b5025adf02')
    @id = params[:id].to_i
    if @id == 1
      $tracks_with_genre = []
      @tracks = client.get('/tracks', :limit => 100, :order => 'created_at')
      @tracks.each do |track|
        if track.genre && track.genre != '' && track.uri != ''
          $tracks_with_genre << track
        end
      end
    end

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
