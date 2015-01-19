module Touches
  extend ActiveSupport::Concern
   
  included do
  end

  module ClassMethods
    def touches(*opts)
      cattr_accessor :touch_relations
      self.touch_relations = opts

      include Touches::LocalInstanceMethods
      #before_save touch_relations!
    end
  end

  module LocalInstanceMethods
    def touch_relations!
      self.class.touch_relations.each do |rel|
        self.send(rel).each(&:touch)
      end
      self.class.name
    end
  end
end

ActiveRecord::Base.send :include, Touches
