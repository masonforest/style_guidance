require 'style_guidance/version'
require 'style_guidance/railtie' if defined?(Rails)

module StyleGuidance
  require 'style_guidance/guideline'
  require 'style_guidance/guidelines/quotes'
  Dir[File.dirname(__FILE__) + "/style_guidance/guidelines/*.rb"].each do|file|
    require file 
  end

  def self.guidelines
    self::Guidelines.constants
      .collect { |const_name| self::Guidelines.const_get(const_name)}
      .select {|const| const.class == Class}
  end

  def self.tasks
    guidelines.map{|guideline| "style:#{guideline.to_sym}" }
  end
end
