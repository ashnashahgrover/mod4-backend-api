class UserTop100Track < ApplicationRecord
  belongs_to :user
  belongs_to :top100_track
end
