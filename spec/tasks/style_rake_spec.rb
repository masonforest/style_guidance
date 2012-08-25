require 'spec_helper'

describe "style" do
  include_context "rake"
  it "replaces all styles when the user enters A" do

    before_path = "spec/fixtures/before/yes_to_all.rb"
    after_path = "spec/fixtures/after/yes_to_all.rb"

    StyleGuidance::Guidelines::Quotes.any_instance.stubs(files: [ before_path ])
    StyleGuidance::Guidelines::Hashes.any_instance.stubs(files: [ before_path ])
    STDIN.expects(getch: "a").at_least_once
    #IO.expects(:write).twice#.with(before_path, IO.read(after_path)).twice
    $stdout.expects(:puts).at_least_once

    rake task_name
  end
end
