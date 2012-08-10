module StyleGuidance
  module Rule
  def self.included(base)
    base.extend ClassMethods
  end
    module ClassMethods
      def to_sym
        :quotes
      end
    end
  end
end
