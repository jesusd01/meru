require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
    test 'render a list of products' do
        get products_path
    
        assert_response :success
      end
    
      test 'allows to create a new product' do
        post products_path, params: {
          product: {
            name: 'item 3',
            description: 'MyText3',
            price: 3,
          }
        }
    
        assert_response :success
      end
    
      test 'does not allow to create a new product' do
        post products_path, params: {
          product: {
            name: 'item 3',
            description: '',
            price: 3,
          }
        }
    
        assert_response :unprocessable_entity
      end

      test 'allows to update a product' do
        get product_path(products(:item1)), params: {
          product: {
            price: 22
          }
        }
    
        assert_response :success
      end

      test 'allows to delete a product' do
        assert_difference('Product.count', -1) do
          delete product_path(products(:item1)), params: {
            id: "1"
          }
        end
    
        assert_response :success
      end
end
