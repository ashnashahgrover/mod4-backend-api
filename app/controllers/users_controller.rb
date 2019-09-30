class UsersController < ApplicationController

    def index
        users= User.all
        render json: users, include: [:user_top100_tracks]
    end

    def create
        user = nil
        spotify_ids = User.all.map{|user|user.spotify_id.to_s}
        if !spotify_ids.include?(allow_params["spotify_id"].to_s)
            user = User.create(allow_params)
        else
            user = User.find_by(spotify_id: allow_params["spotify_id"])
            user.user_top100_tracks.destroy_all
        end
        if user.valid?
            render json: user
        end
    end

    def compare
      current_user = User.find_by(spotify_id: allow_compare["current_user_spotify_id"])
      user_card_user = User.find(allow_compare["user_card_rails_id"])
      current_user.top100_tracks
      user_card_user.top100_tracks
      byebug
    end

    private

    def allow_params()
        params.require(:user).permit!
    end

    def allow_compare()
      params.require(:compare).permit!
    end

end
