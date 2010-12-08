module Aurular
  class SearchResult
    def initialize result_hash
      result_hash.each do |k,v|
        k = k.underscore
        k =~ /id$/ ? v = v.to_i : nil
        class_eval %{attr_reader :#{k}}
        self.instance_variable_set("@#{k}".to_sym, v)
      end
    end
    
    def archive_url
      AUR_URL + url_path
    end
  end
end
