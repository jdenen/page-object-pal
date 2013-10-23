require 'page-object-pal'
require_relative 'pages/CssPass'
require_relative 'pages/CssFail'

describe PageObjectPal do  

  it "returns true on success" do
    PageObjectPal.lookout(CssPass, "http://www.manta.com").should be_true
  end

  it "raises an IdentifierError on failure" do 
    expect { PageObjectPal.lookout(CssFail, "http://www.manta.com") }.to raise_error(PageObjectPal::IdentifierError)
  end

end
