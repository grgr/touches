class Category < ActiveRecord::Base
  #has_and_belongs_to_many :products
  has_many :products_categories
  has_many :products, through: :products_categories
  #has_and_belongs_to_many :exhibitors
  has_many :exhibitors_categories
  has_many :exhibitors, through: :exhibitors_categories
  touches :products, :exhibitors
end
