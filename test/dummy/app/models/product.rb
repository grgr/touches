class Product < ActiveRecord::Base
  has_many :products_categories
  has_many :categories, through: :products_categories
  touches :categories
end
