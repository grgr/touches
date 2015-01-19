class Exhibitor < ActiveRecord::Base
  #has_and_belongs_to_many :categories
  has_many :exhibitors_categories
  has_many :categories, through: :exhibitors_categories
  touches :categories
end
