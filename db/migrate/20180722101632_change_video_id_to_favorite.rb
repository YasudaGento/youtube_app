class ChangeVideoIdToFavorite < ActiveRecord::Migration[5.2]
  def change
    
    def up
      change_column :favorites, :video_id, :string
    end
    
    def down
      change_column :favorites, :video_id, :integer
    end
  end
end
