# frozen_string_literal: true

class MovieCollection::ListItemComponent < ViewComponent::Base
    with_collection_parameter :movie
    def initialize(movie:)
        @title     = movie.title
        @genre     = movie.genre
        @link      = "/collection/#{movie.id}"
        @tv_show   = movie.tv_show
        @rating    = movie.rating
    end
end
