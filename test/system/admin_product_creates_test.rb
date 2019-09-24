require "application_system_test_case"

class AdminProductCreatesTest < ApplicationSystemTestCase
   test "creating a product in the admin" do
     original_product_count = Product.count
     complete_new_product_form

     value(Product.count).must_equal original_product_count + 1
     value(path).must_match(/admin\/products\//)
   end

   def complete_new_product_form
     visit new_admin_product_path
     fill_in 'Name', with: 'New Widget'
     fill_in 'Description', with: 'New widget for the masses'
  
     click_button 'Submit'
     follow_redirect!
   end
end
