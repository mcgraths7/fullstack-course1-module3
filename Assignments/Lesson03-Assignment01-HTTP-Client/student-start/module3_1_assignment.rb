require 'httparty'

class Recipe
    include HTTParty
    ENV['FOOD2FORK_KEY'] = '24b91aab4f4f7dfeb7c9f2f5bfc62499'

    base_uri 'http://food2fork.com/api/'
    default_params key: ENV['FOOD2FORK_KEY']
    format :json

    def self.for(ingredient)
        get('/search', query: { q: ingredient })['recipes']
    end
end
