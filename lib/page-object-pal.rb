require "page-object-pal/version"
require "page-object-pal/elements"
require "page-object-pal/diff"
require "nokogiri"
require "open-uri"

module PageObjectPal
  include PageObjectPal::Elements
  include PageObjectPal::Diff
  extend self

  def lookout(klass, url)
    page_source = Nokogiri::HTML(open(url))
    page_object = parse_class(klass)
    diff_page(page_source, page_object)
    success!
  end

  private
  def success!
    return true
  end

  def parse_class(klass)
    file = find_file(klass)
    methods = find_class_methods(klass)
    elements = parse_methods(methods, file)
  end

  def find_file(klass)
    path = File.join("**", "*.rb")
    Dir.glob(path) do |file|
      next unless File.open(file).read.include? "class #{klass.to_s}"
      return file
    end
  end

  def find_class_methods(klass)
    methods = []
    klass.instance_methods(false).each { |m| methods << m }
  end

end
