# frozen_string_literal: true

class NavBar::BarComponent < ViewComponent::Base
    def initialize(catagory:)
        @catagory = catagory
    end
end
