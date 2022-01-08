class MovieCollection::FilterComponent < ViewComponentReflex::Component
    def initialize
        @term = ''
    end

    def filter_based_on_term
        @term = element.value
        p MovieInfo.where(:genre => @term)
    end
end
