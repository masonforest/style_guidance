require 'io/console'

namespace :style do
  StyleGuidance.rules.each do |rule|
    desc rule::DESCRIPTION
    task rule.to_sym do
      rule.new.apply
    end
  end
end
task :style => StyleGuidance.tasks
