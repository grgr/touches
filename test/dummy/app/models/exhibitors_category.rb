class ExhibitorsCategory < ActiveRecord::Base
  belongs_to :exhibitor
  belongs_to :category
end
