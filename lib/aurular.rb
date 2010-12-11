require 'rubygems'
require 'httparty'
require 'active_support/core_ext/string'

module Aurular
  AUR_URL = %{http://aur.archlinux.org}
  
  autoload :Search, './lib/aurular/search'
  autoload :SearchResult, './lib/aurular/search_result'
end
