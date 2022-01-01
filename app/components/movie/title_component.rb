# frozen_string_literal: true
class Movie::TitleComponent < ViewComponent::Base
    def initialize(title:)
        @title = title
    end
end
