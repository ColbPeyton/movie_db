class Movie::GenreComponent < ViewComponent::Base
    def initialize(genre:)
        @genre = genre
    end
end
