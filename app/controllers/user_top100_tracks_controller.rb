class UserTop100TracksController < ApplicationController

    def index
        all = UserTop100Track.all
        render json: all
    end 

    def create
    end 

end
