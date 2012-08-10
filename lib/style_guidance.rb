require 'style_guidance/version'
require 'style_guidance/railtie' if defined?(Rails)

module StyleGuidance
  require 'style_guidance/rule'
  require 'style_guidance/rules/quotes'
  def self.rules
    self::Rules.constants
      .collect { |const_name| self::Rules.const_get(const_name)}
      .select {|const| const.class == Class}
  end
end
