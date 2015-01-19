class Exhibitor < ActiveRecord::Base
  has_and_belongs_to_many :categories
  touches :categories
end
