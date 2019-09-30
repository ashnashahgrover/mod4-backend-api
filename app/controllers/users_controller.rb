class UsersController < ApplicationController

    def index
        users= User.all
        render json: users, include: [:user_top100_tracks]
    end 

    def create
        user = nil
        spotify_ids = User.all.map{|user|user.spotify_id.to_i}
        if !spotify_ids.include?(allow_params["spotify_id"].to_i)
            user = User.create(allow_params)
        else 
            user = User.find_by(spotify_id: allow_params["spotify_id"])
            user.user_top100_tracks.destroy_all
        end 
        if user.valid?
            render json: user 
        end 
    end 

    def allow_params()
        params.require(:user).permit!
    end 

end
