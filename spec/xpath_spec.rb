require 'page-object-pal'
require_relative 'pages/XpathPass'
require_relative 'pages/XpathFail'

describe PageObjectPal do
  it "returns true with a valid xpath" do
    PageObjectPal.lookout(XpathPass, "http://www.manta.com").should be_true
  end

  it "raises an IdentifierError with an invalid xpath" do
    expect { PageObjectPal.lookout(XpathFail, "http://www.manta.com") }.to raise_error(PageObjectPal::IdentifierError)
  end
end
