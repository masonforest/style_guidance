require 'spec_helper'

describe "StyleGuidance" do
  it 'has many rules' do
    StyleGuidance.rules.should include(StyleGuidance::Rules::Quotes)
  end
end
