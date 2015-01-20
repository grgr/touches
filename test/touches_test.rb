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
    assert_not_equal last_update.to_a, Product.find(product_id).updated_at.to_a
  end

  test "updating a product should update related category but not exhibitor" do
    category = Category.create(name: 'Everything')
    product = Product.create(name: 'Something')
    exhibitor = Exhibitor.create(name: 'Someone')

    category_id = category.id
    exhibitor_id = exhibitor.id

    category.products << product
    category.exhibitors << exhibitor

    category_last_update = category.updated_at
    exhibitor_last_update = exhibitor.updated_at

    sleep 1
    product.update(name: 'Something good')
    #assert_not_equal category_last_update.to_a, Category.find(category_id).updated_at.to_a
    #assert_equal exhibitor_last_update.to_a, Exhibitor.find(exhibitor_id).updated_at.to_a
    assert (category_last_update.to_a != Category.find(category_id).updated_at.to_a) && 
           (exhibitor_last_update.to_a == Exhibitor.find(exhibitor_id).updated_at.to_a)
  end
end
