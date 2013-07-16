module GamesHelper
  def start_game
    button_to "Start Game", start_game_path, method: 'post', class: "btn btn-primary btn-large"
  end
end