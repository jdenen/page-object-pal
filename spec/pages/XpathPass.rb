require 'page-object'

class XpathPass
  include PageObject

  link(:first, :xpath => "//*[@id='main']/div[2]/div[2]/div[2]/span[1]/ul/li[1]/a")
end
