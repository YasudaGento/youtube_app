class Favorite < ApplicationRecord
  validates :user_id, {presence: true}
  validates :video_id, {presence: true}
end
