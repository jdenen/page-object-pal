require 'rspec'

describe PageObjectPal do
  Given(:obj) { require_relative 'Page'; Page }
  Given(:src) { "http://www.manta.com" }

  Then { PageObjectPal.lookout(obj, src).should be_true }
end
