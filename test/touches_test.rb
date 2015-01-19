require 'test_helper'

class TouchesTest < ActiveSupport::TestCase
  #logger ||= Logger.new

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
    #product.categories << category
    category.products << product
    Rails.logger.info "in test: product.categories.first.name = #{product.categories.first && product.categories.first.name}"
    Rails.logger.info "in test: category.products.first.name = #{category.products.first && category.products.first.name}"
    last_update = product.updated_at
    puts "last_update = #{last_update}"
    sleep 1
    category.update(name: 'Everthing else')
    Rails.logger.info "in test: product.categories.first.name = #{product.categories.first && product.categories.first.name}"
    Rails.logger.info "in test: category.products.first.name = #{category.products.first && category.products.first.name}"
    assert_not_equal last_update, product.updated_at, "last_update = #{last_update}, product.updated_at = #{product.updated_at}"
    #
    #assert true
    #assert Category.first.touch_relations! == "Category"
  end
end
