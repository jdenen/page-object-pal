require 'rspec'

describe PageObjectPal, :private => true do
  Given(:source) { Nokogiri::HTML(open("http://www.manta.com")) }

  context "using unsupported identifying property" do
    Then { expect { PageObjectPal.scrub_source('a', {:numero => 'uno'}, source) }.to raise_error(PageObjectPal::SupportError) }
  end

  context "using invalid identification" do
    context "HTML selectors" do
      Then { expect { PageObjectPal.scrub_source('a', {:class => 'invalid-class'}, source) }.to raise_error(PageObjectPal::PageObjectOutdated) }
      Then { expect { PageObjectPal.scrub_source('a', {:id => 'invalid-id'}, source) }.to raise_error(PageObjectPal::PageObjectOutdated) }
      Then { expect { PageObjectPal.scrub_source('a', {:index => 9000}, source) }.to raise_error(PageObjectPal::PageObjectOutdated) }
      Then { expect { PageObjectPal.scrub_source('a', {:text => 'xxcvxddvndxm'}, source) }.to raise_error(PageObjectPal::PageObjectOutdated) }
    end

    context "Xpath selector" do
      Then { expect { PageObjectPal.scrub_source('a', {:xpath => "//a[@id='invalid-id']"}, source) }.to raise_error(PageObjectPal::PageObjectOutdated) }
    end
  end

end
