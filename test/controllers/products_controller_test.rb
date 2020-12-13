require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
    assert_select 'h2','Products'
  end



  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      Product.create({name: "product1", collection: "collection1", image: "image1", category: "category1" + " create"})
    end
  end



  test "should destroy product" do
    assert_difference('Product.count', -1) do
      @product.destroy
    end
  end


end
