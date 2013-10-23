require 'rspec'

describe PageObjectPal do
  describe "#parse_element" do
    context "passed uncommented line" do
      Then { PageObjectPal.parse_element('link(:stuff, :xpath => "//a")').should be_a_kind_of(Hash) }
    end

    context "passed commented line" do
      Then { PageObjectPal.parse_element('#link(:stuff, :xpath => "//a"').should be_nil }
    end
  end

end
