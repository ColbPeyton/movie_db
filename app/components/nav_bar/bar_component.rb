# frozen_string_literal: true

class NavBar::BarComponent < ViewComponent::Base
    def initialize(title:)
        @title = title
    end
end
