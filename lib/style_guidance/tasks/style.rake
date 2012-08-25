require 'io/console'
include Rake::DSL

namespace :style do
  StyleGuidance.guidelines.each do |guidline|
    desc guidline::DESCRIPTION
    task guidline.to_sym do
      guidline.new.apply
    end
  end
end
task :style => StyleGuidance.tasks
