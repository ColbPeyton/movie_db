class MovieCollection::TotalCollectionComponent < ViewComponent::Base
    include Pagy::Backend
    include Pagy::Frontend

    ITEMS = 10
    def initialize(movies:)
        @pagy, @movies = pagy_countless(movies.all, page: 1, items: ITEMS )
    end

end