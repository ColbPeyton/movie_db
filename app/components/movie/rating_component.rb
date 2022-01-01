class Movie::RatingComponent < ViewComponent::Base
    def initialize(rating:)
        @rating = rating
    end
end
