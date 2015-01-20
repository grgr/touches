module Touches
  extend ActiveSupport::Concern
   
  included do
  end

  module ClassMethods
    def touches(*opts)
      cattr_accessor :touch_relations
      self.touch_relations = opts
      before_save { |record| record.touch_relations! }

      include Touches::LocalInstanceMethods
    end
  end

  module LocalInstanceMethods
    def touch_relations!
      #unless self.changed.include? "updated_at"
        self.class.touch_relations.each do |rel|
          self.send(rel, true).each(&:touch)
        end
      #end
    end
  end
end

ActiveRecord::Base.send :include, Touches
