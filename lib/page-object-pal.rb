require "page-object-pal/version"
require "page-object-pal/elements"
require "page-object-pal/diff"
require "nokogiri"
require "open-uri"

module PageObjectPal
  include PageObjectPal::Elements
  include PageObjectPal::Diff
  extend self

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

  def parse_class(klass, path)
    methods = find_class_methods(klass)
    elements = parse_methods(methods, path)
  end

  def find_class_methods(klass)
    methods = []
    klass.instance_methods(false).each { |m| methods << m }
  end

end
