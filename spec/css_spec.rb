require 'page-object-pal'
require 'page-object-pal/spec/pages/CssPass'
require 'page-object-pal/spec/pages/CssFail'

describe PageDoctor do  

  it "returns true on success" do
    PageDoctor.dx(CssPass, "http://www.manta.com").should be_true
  end

  it "raises an IdentifierError on failure" do 
    expect { PageDoctor.dx(CssFail, "http://www.manta.com") }.to raise_error(PageDoctor::IdentifierError)
  end

end
