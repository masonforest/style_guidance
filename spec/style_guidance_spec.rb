require 'spec_helper'

describe "StyleGuidance" do
  it 'has many guidelines' do
    StyleGuidance.guidelines.should include(StyleGuidance::Guidelines::Quotes)
  end
end
