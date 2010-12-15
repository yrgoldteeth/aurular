module Aurular
  class Search
    include Enumerable
    include HTTParty
    base_uri AUR_URL
    format :json
    cattr_reader :last_search
    
    class << self
      def search *args
        search_terms  = URI.escape(args.join(' '))
        options       = {:type => 'search', :arg => search_terms}
        query         = get('/rpc.php?', :query => options)
        save_last_search(query)
        @@last_search
      end

      def last_search
        @@last_search ||= get_last_search
      end

      private
      def get_last_search
        @@last_search = []
        if File.exist?(LAST_RESULTS_PATH)
          result_lines = File.open(LAST_RESULTS_PATH, 'r').readlines
          result_lines.each {|l| @@last_search << JSON.parse(l)}
        end
      end

      def save_last_search query
        @@last_search = query["results"]
        File.delete(LAST_RESULTS_PATH) if File.exist?(LAST_RESULTS_PATH)
        file = File.open(LAST_RESULTS_PATH, 'a')
        @@last_search.each {|s| file.puts(s.to_s)}
      end
    end

    attr_reader :results

    def initialize *args
      @results = []
      if args.any?
        query = self.class.search(args)
        query.each do |sr|
          results << Aurular::SearchResult.new(sr)
        end
      end
    end

    def each
      @results.each{|r| yield r} 
    end 
  end
end
