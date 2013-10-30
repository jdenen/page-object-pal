require 'page-object'

class Page 
  include PageObject
  link(:by_class, :class => "coolLight")
  link(:by_id, :id => "signup-nav-header")
  link(:by_index, :index => 0)
  link(:by_text, :text => "Advertise With Us")
  link(:by_xpath, :xpath => "(//a)[1]")
  element(:by_element, :a, :xpath => "(//a)[1]")

  def self.polished_pass?
    PageObjectPal.examine(self, __FILE__, "www.manta.com")
  end

  def self.unpolished_pass?
    PageObjectPal.examine(self, __FILE__, "http://www.manta.com")
  end

end
