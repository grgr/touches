class Product < ActiveRecord::Base
  #has_and_belongs_to_many :categories
  has_many :products_categories
  has_many :categories, through: :products_categories
  touches :categories
end
