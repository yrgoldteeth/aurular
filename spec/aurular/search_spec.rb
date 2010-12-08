require 'spec_helper'

describe Aurular::Search do
  describe '#initialize' do
    context 'with no args' do
      before {@search = Aurular::Search.new}

      it 'returns an empty collection' do
        @search.count.should == 0
      end
    end

    context 'with args' do
      before {@search = Aurular::Search.new('rspec')}

      it 'returns a collection of Aurular::SearchResult objects' do
        @search.map{|s|s.class}.uniq.should == [Aurular::SearchResult]
      end
    end
  end
end

