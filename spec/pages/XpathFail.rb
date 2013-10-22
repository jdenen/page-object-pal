require 'page-object'

class XpathFail
  include PageObject

  link(:fail, :xpath => "//a[contains(@id, 'failure-id')]")
end
