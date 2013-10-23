require 'rspec'

describe PageObjectPal, :private => true do
  Given(:source) { Nokogiri::HTML(open("http://www.manta.com")) }

  context "using invalid property identifier" do
    Then { expect { PageObjectPal.scrub_css('a', :numero, 'uno', source) }.to raise_error(PageObjectPal::SupportError) }
  end

  context "using invalid identification" do
    context "CSS" do
      Then { expect { PageObjectPal.scrub_css('a', :id, 'invalid-id', source) }.to raise_error(PageObjectPal::IdentifierError) }
    end

    context "Xpath" do
      Then { expect { PageObjectPal.scrub_xpath('a', "//a[@id='invalid-id']", source) }.to raise_error(PageObjectPal::IdentifierError) }
    end
  end

end
