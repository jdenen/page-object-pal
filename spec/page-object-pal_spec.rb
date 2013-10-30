require 'rspec'

describe PageObjectPal do
  Given(:page) { require_relative 'Page'; Page }
  Given(:path) { File.join(File.dirname(__FILE__), "Page.rb") }
  Given(:src) { "http://www.manta.com" }
  Given(:pol_src) { "www.manta.com" }

  context "Evaluate from outside PageObject" do
    Then { PageObjectPal.examine(page, path, src).should be_true }
    Then { PageObjectPal.examine(page, path, pol_src).should be_true }
  end

  context "Evaluate from PageObject method" do
    Then { page.polished_pass?.should be_true }
    Then { page.unpolished_pass?.should be_true }
  end

end
