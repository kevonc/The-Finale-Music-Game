class AddArtworkToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :artwork, :string
  end
end
