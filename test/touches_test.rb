require 'test_helper'

class TouchesTest < ActiveSupport::TestCase

  test "Category touch_relations should include :products" do
    assert Category.touch_relations.include? :products
    assert Category.touch_relations.include? :exhibitors
  end

  test "Product touch_relations should include :categories" do
    assert Product.touch_relations.include? :categories
  end

  test "updating a category should update related product" do
    category = Category.create(name: 'Everything')
    product = Product.create(name: 'Something')
    product_id = product.id
    product.categories << category
    #category.products << product
    last_update = product.updated_at
    sleep 1
    category.update(name: 'Everthing else')
    assert_not_equal last_update, Product.find(product_id).updated_at, "last_update = #{last_update}, product.updated_at = #{product.updated_at}"
  end
end
