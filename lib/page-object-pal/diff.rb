require 'page-object-pal/exceptions'
require 'page-object-pal/elements'

module PageObjectPal
  module Diff
    include PageObjectPal::Elements

    # 
    # Find page object defined methods that do not match code
    # in the source HTML.
    #
    def diff_page(source, elements)
      elements.each do |e_hash|
        e_hash.each do |elem, identifier|
          scrub_source(elem, identifier, source)
        end
      end
    end

    # 
    # Look for code in the source HTML matching the identifying
    # code defined in the page object class.
    #
    def scrub_source(tag, identifier, source)
      identifier.each do |prop, val|
        scrub_css(tag, prop, val, source) unless prop == :xpath
        scrub_xpath(tag, val, source) if prop == :xpath
      end
    end

    # TODO Merge into #scrub_source 
    def scrub_css(tag, prop, pval, source)
      case prop
      when :class
        match = source.css("#{tag.to_s}.#{pval}")
      when :id
        match = source.css("#{tag.to_s}##{pval}")
      when :index
        match = source.css("#{tag.to_s}")[pval.to_i]
      when :text
        match = source.search("[text()*='#{pval}']")
      else
        raise SupportError, "PageObjectPal does not support elements identified with '#{prop}'... yet"
      end

      raise PageObjectOutdated, "Could not identify '#{html_to_dsl(tag)}' where :#{prop} == '#{pval}'" if failure? match
    end

    # TODO Merge into #scrub_source
    def scrub_xpath(anchor, xpath, source)
      match = source.xpath(xpath)
      raise PageObjectOutdated, "Could not identify '#{html_to_dsl(anchor)}' where :xpath == '#{xpath}'" if failure? match
    end

    def failure?(scrubs)
      scrubs.to_a.empty?
    end

  end
end
