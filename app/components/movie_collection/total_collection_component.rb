class MovieCollection::TotalCollectionComponent < ViewComponentReflex::Component
    include Pagy::Backend
    include Pagy::Frontend

    ITEMS = 10
    def initialize(movies:)
        # @pagy, @movies = pagy_countless(movies.all, page: 1, items: ITEMS )
        @movies = movies
        @count = 0

    end
    def increment
        @count += 1
    end
end




# <div class="row justify-content-center row-cols-2">

# <%= render MovieCollection::ListItemComponent.with_collection @movies %>
# <%== pagy_nav(@pagy) %>
# </div>