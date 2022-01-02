class Movie::TimesWatchedComponent < ViewComponent::Base
    def initialize(times_watched:)
        @times_watched = times_watched
    end
end
