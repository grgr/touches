module Touches
  extend ActiveSupport::Concern
   
  included do
  end

  module ClassMethods
    def touches(*opts)
      cattr_accessor :touch_relations
      self.touch_relations = opts
      before_save { |record| logger.info "record.name = #{record.name}"; record.touch_relations! }

      include Touches::LocalInstanceMethods
    end
  end

  module LocalInstanceMethods
    def touch_relations!
      logger.info "in touchrelations! self.class.name = #{self.class.name}"
      logger.info "in touchrelations! self.name = #{self.name}"
      self.class.touch_relations.each do |rel|
        logger.info "in touchrelations! rel = #{rel}"
        logger.info "in touchrelations! rel.first.name = #{self.send(rel).first && self.send(rel).first.name}"
        self.send(rel).each(&:touch)
      end
    end
  end
end

ActiveRecord::Base.send :include, Touches
