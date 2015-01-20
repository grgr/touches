class ProductsCategory < ActiveRecord::Base
  belongs_to :product, touch: true
  belongs_to :category, touch: true
end
