class ChangeDatatypeVideoIdOfFavorites < ActiveRecord::Migration[5.2]
  def change
    change_column :favorites, :video_id, :string
  end
end
