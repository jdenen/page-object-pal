require 'rspec'

describe PageObjectPal do
  context "Converting to-and-from PageObject DSL" do
    context "Converting most tags" do
      ['div','image','link','list_item','ordered_list','paragraph','radio_button','unordered_list'].each do |anchor_tag|
        Then { PageObjectPal.html_to_dsl(PageObjectPal.dsl_to_html(anchor_tag)).should == anchor_tag }
      end
    end
    
    context "Converting text_area and text_field" do
      Then { PageObjectPal.html_to_dsl(PageObjectPal.dsl_to_html("text_area")).should == "text_field/text_area" }
      And { PageObjectPal.html_to_dsl(PageObjectPal.dsl_to_html("text_field")).should == "text_field/text_area" }
    end
  end
end
