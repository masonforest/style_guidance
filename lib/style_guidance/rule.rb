module StyleGuidance
  module Rule

  def self.included(base)
    base.extend ClassMethods
  end

  def files
    Dir["**/*"].select{|file| ["rb"].include?(File.extname(file)[1..-1]) }
  end
    module ClassMethods
      def initialize
        @yes_to_all = false
      end

      def to_sym
        name.split('::')[-1].downcase.to_sym
      end
    end
  end
end
