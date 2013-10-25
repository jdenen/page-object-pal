# PageObjectPal

PageObjectPal keeps an eye on your [page-object](https://github.com/cheezy/page-object) classes, alerting you to outdated element information. Unit test your page classes with PageObjectPal, and don't wait for your acceptance tests to fail!

## Installation

Add this line to your application's Gemfile:

    gem 'page-object-pal'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install page-object-pal

## Usage

PageObjectPal is a self-extending module and needs only one method call. `PageObjectPal#examine` takes three arguments: a class, a filepath, and a URL. It returns ```true``` if your page objects pass, and raises a `PageObjectInvalid` error if they fail.

Call `PageObjectPal#examine` from your specs:
```ruby
require 'page-object-pal'
describe Page do
  it "should reference valid elements in its methods" do
    PageObjectPal.examine(Page, '/path/to/Page', 'http://www.page.com').should be_true
  end
end
```

Or wrap `PageObjectPal#examine` in a class method to be called in your specs:
```ruby
require 'page-object'
require 'page-object-pal'
class Page
  include 'PageObject'
  def self.examine
    PageObjectPal.examine(self, __FILE__, 'http://www.page.com')
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Write tests for your feature
4. Code until your tests pass (`rake`)
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create new Pull Request

## Testing

I'm partial to the rspec-given syntax and use it in [my unit tests](/spec). Please do the same. If you're unfamiliar with [rspec-given](https://github.com/jimweirich/rspec-given), you should check it out!

## Issues/Comments/Questions?
Write something up in the [Issues Tracker](https://github.com/jdenen/page-object-pal/issues). Or contact me via twitter, [@jpdenen](http://twitter.com/jpdenen)!
