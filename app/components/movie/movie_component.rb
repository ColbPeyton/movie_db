class Movie::MovieComponent < ViewComponent::Base
    include Movie
    def initialize(movie:)
        @title          = movie.title
        @rating         = movie.rating
        @date_watched   = movie.date_watched
        @times_watched  = movie.times_watched
        @genre          = movie.genre
        @tv_show        = movie.tv_show
    end
end

# start on adding times_watched, genre, art components
