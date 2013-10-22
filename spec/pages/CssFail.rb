require 'page-object'

class CssFail
  include PageObject
  link(:fail, :id => "not-a-valid-id")
end
