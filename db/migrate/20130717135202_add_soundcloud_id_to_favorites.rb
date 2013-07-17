class AddSoundcloudIdToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :soundcloud_id, :string
  end
end
