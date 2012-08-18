require 'spec_helper'
describe "style:hashes" do
  include_context "rake"
  let (:before_path) { "spec/fixtures/before/hashes.rb" }
  let (:after_path) { "spec/fixtures/after/hashes.rb" }

  it "converts hash syntax to 1.9 style hashes" do
    StyleGuidance::Rules::Hashes.any_instance.stubs(files: [ before_path ])
    STDIN.expects(getch: "y")
    IO.expects(:write).with(before_path, IO.read(after_path))
    $stdout.expects(:puts).at_least_once

    rake task_name
  end

end
