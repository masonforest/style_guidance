require "rake"
require 'pry'

shared_context "rake" do
  let(:rake_app)      { Rake::Application.new }
  let(:task_name) { self.class.top_level_description }
  let(:task_path) { "lib/style_guidance/tasks/#{task_name.split(":").first}.rake" }

  before do
    Rake.application = rake_app
    load task_path
    Rake::Task.define_task(:environment)
  end

  def rake(task_name)
    rake_app[task_name].invoke
  end
end
