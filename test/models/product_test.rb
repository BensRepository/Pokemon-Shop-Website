require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test 'should not save empty product' do
    product = Product.new

    product.save
    refute product.valid?
  end

  test 'should save product' do
    product = Product.new

    product.name = 'Box'
    product.category = 'category'
    product.collection = 'collection'
    product.image = 'image'
    assert product.valid?
  end

  test 'should not save duplucate products' do
    product1 = Product.new
    product1.name = 'cool product'
    product1.category = 'super cool'
    product1.collection = 'cool collection'
    product1.image = 'picture'
    assert product1.valid?

    product2 = Product.new
    product2.name = 'MyString'
    product2.category = 'MyString'
    product2.collection = 'MyString'
    product2.image = 'MyString'
    refute product2.valid?
  end
end
