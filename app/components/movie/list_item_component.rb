# frozen_string_literal: true

class ListItemComponent < ViewComponent::Base
    def initialize(movie:)
        @title = movie['title']
        @rating = movie['rating']
    end
end
