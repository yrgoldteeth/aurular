module Aurular
  class Search
    include Enumerable
    include HTTParty
    base_uri AUR_URL
    format :json
    
    class << self
      def search *args
        search_terms = URI.escape(args.join(' '))
        options      = {:type => 'search', :arg => search_terms}
        get('/rpc.php?', :query => options)
      end
    end

    attr_reader :results

    def initialize *args
      @results = []
      query_results = args.any? ? self.class.search(args) : []
      query_results.each do |sr|
        results << Aurular::SearchResult.new(sr)
      end
    end

    def each
      @results.each{|r| yield r} 
    end 
  end
end
