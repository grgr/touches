class ExhibitorsCategory < ActiveRecord::Base
  belongs_to :exhibitor, touch: true
  belongs_to :category, touch: true
end
