require 'rubygems'
require 'httparty'
require 'active_support/core_ext/string'
require 'active_support/core_ext/class'

module Aurular
  AUR_URL = %{http://aur.archlinux.org}
  LAST_RESULTS_PATH = './data/last_results.json.txt'
  
  autoload :Search, './lib/aurular/search'
  autoload :SearchResult, './lib/aurular/search_result'
  autoload :Package, './lib/aurular/package'
end
