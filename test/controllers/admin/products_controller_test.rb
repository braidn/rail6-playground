require 'test_helper'

class Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  describe '#new' do
    it 'responds with a 200' do
      get new_admin_product_path

      expect(response.code).must_equal '200'
    end
  end

  describe "#create" do
    it 'allows creating a new product' do
      previous_count = Product.count
      post admin_products_path new_product

      expect(Product.count).must_equal previous_count + 1 
    end

    it 'redirects the user to the product admin page' do
      post admin_products_path new_product

      expect(response.code).must_equal '302'
      follow_redirect!
      expect(path).must_match(/admin\/products\//)
    end
  end

  def new_product
    {
      product: {
        name: "Funzies",
        description: "Something ELSE"
      }
    }
  end
end
