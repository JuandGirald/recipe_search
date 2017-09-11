module RecipeMethods
  extend ActiveSupport::Concern

  class Api
    include HTTParty
    base_uri 'www.recipepuppy.com'

    def initialize(query, page)
      @options = { query: { q: query, p: page } }
      @data = []
    end

    # parse and get response data from the recipe API
    def response
      @data = parse_response(self.class.get('/api', @options))
      second_call if @data.count == 10
    end

    # make a second call when get 10 results from first page
    def second_call
      @options[:query][:p] = 2
      @data = @data + parse_response(self.class.get('/api', @options))
    end

    private
      def parse_response(data)
        JSON.parse(data.parsed_response)["results"]
      end
  end
end