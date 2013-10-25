require "page-object-pal/version"
require "page-object-pal/elements"
require "page-object-pal/diff"
require "nokogiri"
require "open-uri"
# 
# Module that will compare element identifying information used to define 
# instance methods in PageObject classes to the HTML source code of a URL.
# Use to keep page objects from becoming stale/unit testing your classes.
#
# Can be used independent of class to unit test page object.
# @example Independent test
#   describe Page do
#     it "calls upon valid elements in its instance methods" do
#       PageObjectPal.examine(Page, 'path/to/page/file', 'http://www.page.com').should be_true
#     end
#   end
#
# Can wrapped in a page object class method for validation.
# @example Class method
#   class Page
#     include PageObject
#
#     def self.elements_still_valid
#       PageObjectPal.examine(self, __FILE__, 'http://www.page.com')
#     end
#   end
#
module PageObjectPal
  include PageObjectPal::Elements
  include PageObjectPal::Diff
  extend self

  # 
  # Compare elements constructed by the PageObject::DSL to the elements in the 
  # URL's source code.
  #
  # @param [Class] Page object class to be tested
  # @param [String] Path to the file housing the class being tested
  # @param [String] Page URL
  #
  # @return [Boolean] True if no error is raised
  #
  def examine(klass, path, url)
    page_source = Nokogiri::HTML(open(url))
    page_object = parse_class(klass, path)
    diff_page(page_source, page_object)
    success!
  end

  private
  def success!
    true
  end

  #
  # Parse elements from the page object class methods. 
  # 
  def parse_class(klass, path)
    methods = find_class_methods(klass)
    elements = parse_methods(methods, path)
  end

  # 
  # Grab instance methods defined in the page object class and not its super classes.
  #
  def find_class_methods(klass)
    methods = []
    klass.instance_methods(false).each { |m| methods << m }
  end

end
