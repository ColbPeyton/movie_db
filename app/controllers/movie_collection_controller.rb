class MovieCollectionController < ApplicationController
    layout "home"

    def index
        MovieInfo.connection
        @movies = MovieInfo.all
    end

    def show
        @movie = MovieInfo.find(params[:id])
    end
end
