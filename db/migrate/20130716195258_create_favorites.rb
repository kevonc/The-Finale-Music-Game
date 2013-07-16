class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.belongs_to :user
      t.string :track
      t.string :url

      t.timestamps
    end
  end
end
