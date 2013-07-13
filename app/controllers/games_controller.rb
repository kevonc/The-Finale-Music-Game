class GamesController < ApplicationController
  def index
  end

  def level
    id = params[:id].to_i
    client = Soundcloud.new(:client_id => 'fd18da9af13744f5233916b5025adf02')
    @tracks = client.get('/tracks', :limit => 100, :order => 'created_at')

    @track = @tracks[id]

  end

  def score
  end
end
