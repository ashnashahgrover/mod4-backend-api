class UsersController < ApplicationController

    def index
        users= User.all
        render json: users, include: [:top100_tracks]
    end

    def create
        user = nil
        spotify_ids = User.all.map{|user|user.spotify_id.to_s}
        if !spotify_ids.include?(allow_params["spotify_id"].to_s)
            user = User.create(allow_params)
        else
            user = User.find_by(spotify_id: allow_params["spotify_id"])
            user.update(allow_params)
            user.user_top100_tracks.destroy_all
        end
        if user.valid?
            render json: user
        end
    end

    def compare

      current_user = User.find_by(spotify_id: allow_compare["current_user_spotify_id"])
      user_card_user = User.find(allow_compare["user_card_rails_id"])

      current_user_album_ids = current_user.top100_tracks.map{|track| track.album_id}
      user_card_user_album_ids = user_card_user.top100_tracks.map{|track|track.album_id}

      current_user_artist_ids = current_user.top100_tracks.map{|track|track.artist_id}
      user_card_user_artist_ids = user_card_user.top100_tracks.map{|track|track.artist_id}

      shared_albums = current_user_album_ids & user_card_user_album_ids
      names_of_shared_albums = shared_albums.map{|album_id| Top100Track.find_by(album_id: album_id).album_name}.uniq

      shared_tracks = current_user.top100_tracks & user_card_user.top100_tracks
      names_of_shared_tracks = shared_tracks.map{|track| track.name }.uniq

      shared_artists = current_user_artist_ids & user_card_user_artist_ids
      names_of_shared_artists = shared_artists.map{|artist_id| Top100Track.find_by(artist_id: artist_id).artist_name}

      render json:
        {shared_artists: names_of_shared_artists,
        shared_tracks: names_of_shared_tracks,
        shared_albums: names_of_shared_albums}

    end

    private

    def allow_params()
        params.require(:user).permit!
    end

    def allow_compare()
      params.require(:compare).permit!
    end

end
