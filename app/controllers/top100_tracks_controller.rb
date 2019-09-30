class Top100TracksController < ApplicationController
    def index
        tracks = Top100Track.all
        render json: tracks
    end

    def create
        user = User.find_by(spotify_id: params.permit![:user_id])
        track = Top100Track.find_by(spotify_id:allow_params["spotify_id"])
        if track
            track.update(allow_params)
            UserTop100Track.create(user:user,top100_track:track)
        else
            track = Top100Track.create(allow_params)
            UserTop100Track.create(user:user, top100_track:track)
        end
        if track.valid?
            render json: track
        end
    end

    def allow_params()
        params.require(:top100_track).permit!
    end

end
