module GamesHelper
  def start_game
    button_to "Start Game", start_game_path, method: 'post'
  end
end

# @current_track_genre