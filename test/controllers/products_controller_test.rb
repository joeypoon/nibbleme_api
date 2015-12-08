require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = create :product
  end

  test 'can get index' do
    get :index
    assert_response 200
    assert_not_nil assigns(:products)
  end

  test 'can post create' do
    assert_difference 'Product.count' do
      product = attributes_for :product
      post :create, product: product
      assert_response 200
    end
  end

  test 'can get show' do
    get :show, id: @product.id
    assert_response 200
  end
end