require 'spec_helper'

describe Aurular::SearchResult do
  before do
    @result_hash   = {'id'          => '123', 
                      'name'        => 'random software package',
                      'url_path'    => '/path/to/tar.gz',
                      'category_id' => '17', 
                      'location_id' => '2'}
    @search_result = Aurular::SearchResult.new(@result_hash)
  end

  it 'sets id value to integer' do
    @search_result.id.should == @result_hash['id'].to_i
  end

  it 'sets *_id values to integers' do
    @search_result.location_id.should == @result_hash['location_id'].to_i
    @search_result.category_id.should == @result_hash['category_id'].to_i
  end

  describe '#archive_url' do
    it 'returns full download url' do
      @search_result.archive_url.should == Aurular::AUR_URL + @result_hash['url_path']
    end
  end
end

  
    

