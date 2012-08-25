module StyleGuidance
  module Guideline

  def self.included(base)
    base.extend ClassMethods
  end

  def files
    ruby_files - excluded_files
  end

  def ruby_files
    Dir["**/*"].select{|file| ["rb"].include?(File.extname(file)[1..-1]) }
  end

  def excluded_files
    [
      "db/schema.rb"
    ]
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
