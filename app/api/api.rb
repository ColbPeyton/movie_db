require 'grape'

# grape URLs
# :version/resource/method
# v1/list/complete

module MyApi
    version 'v1', :using => :path
    class MovieList < Grape::API
        resource :list do
            get :complete do
                params
            end
    end
end