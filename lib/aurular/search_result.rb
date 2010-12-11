module Aurular
  class SearchResult
    attr_reader :id, :name, :category_id, :description, :location_id
    attr_reader :url, :url_path, :license, :num_votes, :out_of_date

    def initialize result_hash
      result_hash.each do |k,v|
        self.instance_variable_set("@#{k.underscore}".to_sym, v)
      end
    end

    def inspect
      %{"#<#{self.class} - #{name}>"}
    end

    def to_s
      name
    end
  end


end
