require 'page-object-pal'
require_relative 'pages/XpathPass'
require_relative 'pages/XpathFail'
require_relative 'pages/CssPass'
require_relative 'pages/CssFail'

describe PageObjectPal do
  context "Nokogiri::HTML" do
    it "returns true for valid elements" do
      PageObjectPal.lookout(CssPass, "http://www.manta.com").should be_true
    end

    it "raises an IdentifierError for invalid elements" do
      expect { PageObjectPal.lookout(CssFail, "http://www.manta.com") }.to raise_error(PageObjectPal::IdentifierError)
    end
  end

  context "Nokogiri::Xpath" do
    it "returns true for valid elements" do
      PageObjectPal.lookout(XpathPass, "http://www.manta.com").should be_true
    end

    it "raises an IdentifierError for invalid elements" do
      expect { PageObjectPal.lookout(XpathFail, "http://www.manta.com") }.to raise_error(PageObjectPal::IdentifierError)
    end
  end

end
