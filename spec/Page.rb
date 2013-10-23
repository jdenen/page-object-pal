require 'page-object'

class Page 
  include PageObject
  link(:by_class, :class => "coolLight")
  link(:by_id, :id => "signup-nav-header")
  link(:by_index, :index => 0)
  link(:by_text, :text => "Advertise With Us")
  link(:by_xpath, :xpath => "(//a)[1]")
end
