require 'rspec'

describe PageObjectPal, :private => true do
  describe "#find_file" do
    context "finds and returns file containing given class" do
      Given(:klass) { require_relative 'Page'; Page }
      Then { PageObjectPal.find_file(klass).should == "spec/Page.rb" }
    end

    context "raises CannotFindClass error when it cannot determine class file" do
      Given(:fake) { Class.new }
      Then { expect { PageObjectPal.find_file(fake) }.to raise_error(PageObjectPal::CannotFindClass)  }
    end
  end
end
