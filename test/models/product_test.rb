require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  it 'has a valid fixture' do
    Product.count.must_equal 2
  end
end
