class User < ApplicationRecord
    has_many :user_top100_tracks, dependent: :destroy
    has_many :top100_tracks, through: :user_top100_tracks
end
