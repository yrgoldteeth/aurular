module Aurular
  class Search
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
      raise "need search terms to be useful" if args.count == 0

      @results = []
      query    = self.class.search(args)
      query_results = query["results"] || []

      query_results.each do |sr|
        results << Aurular::SearchResult.new(sr)
      end
    end
  
  end
end
