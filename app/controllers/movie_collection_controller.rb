class MovieCollectionController < ApplicationController
    layout "home"

    def index
        @movies = MovieInfo.all
    end

    def show
        @movie = MovieInfo.find(params[:id])
    end
end
