require 'spec_helper'

describe "style:quotes" do
  include_context "rake"
  BEFORE_PATH="spec/fixtures/before/quotes.rb"
  AFTER_PATH="spec/fixtures/after/quotes.rb"

  it "removes double quotes if they are not around interpolated strings" do
    Dir.expects(:[]).returns([BEFORE_PATH])
    STDIN.expects(getch: "y")
    IO.expects(:write).with(BEFORE_PATH, IO.read(AFTER_PATH))
    $stdout.expects(:puts).at_least_once
    subject.invoke
  end

end
