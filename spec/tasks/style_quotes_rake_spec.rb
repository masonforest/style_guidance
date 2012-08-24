require 'spec_helper'

describe "style:quotes" do
  include_context "rake"

  let (:before_path) { "spec/fixtures/before/quotes.rb" }
  let (:after_path) { "spec/fixtures/after/quotes.rb" }

  it "removes double quotes if they are not around interpolated strings" do
    StyleGuidance::Guidelines::Quotes.any_instance.stubs(files: [ before_path ])
    STDIN.expects(getch: "y")
    IO.expects(:write).with(before_path, IO.read(after_path))
    $stdout.expects(:puts).at_least_once

    rake task_name
  end
end
