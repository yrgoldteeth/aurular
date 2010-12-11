module Aurular
  class SearchResult
    def initialize result_hash
      result_hash.each do |k,v|
        class_eval %{attr_reader :#{k.underscore}}
        self.instance_variable_set("@#{k.underscore}".to_sym, v)
      end
    end
  end
end
