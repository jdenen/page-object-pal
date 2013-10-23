require 'page-object'

class CssPass
  include PageObject
  link(:by_index, :index => 0)
  link(:by_id, :id => "signup-nav-header")
  link(:by_class, :class => "coolLight")
  link(:by_text, :text => "Advertise With Us")
end
