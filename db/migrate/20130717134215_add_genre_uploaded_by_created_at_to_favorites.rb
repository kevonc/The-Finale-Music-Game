class AddGenreUploadedByCreatedAtToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :genre, :string
    add_column :favorites, :uploaded_by, :string
    add_column :favorites, :created, :date
  end
end
