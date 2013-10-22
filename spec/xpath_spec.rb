require 'page-object-pal'
require 'page-object-pal/spec/pages/XpathPass'
require 'page-object-pal/spec/pages/XpathFail'

describe PageDoctor do
  it "returns true with a valid xpath" do
    PageDoctor.dx(XpathPass, "http://www.manta.com").should be_true
  end

  it "raises an IdentifierError with an invalid xpath" do
    expect { PageDoctor.dx(XpathFail, "http://www.manta.com") }.to raise_error(PageDoctor::IdentifierError)
  end
end
