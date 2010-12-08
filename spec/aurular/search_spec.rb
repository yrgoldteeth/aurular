require 'spec_helper'

describe Aurular::Search do
  describe '#initialize' do
    context 'with no args' do
      before {@search = Aurular::Search.new}

      it 'returns an empty collection' do
        @search.results.count.should == 0
      end
    end
  end
end

