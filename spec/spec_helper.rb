require 'rspec-given'
require 'page-object-pal'

RSpec.configure do |config|
  config.before :each, :private => true do
    PageObjectPal.class_eval do
      public *private_instance_methods
    end
  end
end
