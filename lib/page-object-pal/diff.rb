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
      identifier.each do |prop, prop_val|
        match = case prop
        when :class
          source.css("#{tag.to_s}.#{prop_val}")
        when :id
          source.css("#{tag.to_s}##{prop_val}")
        when :index
          source.css("#{tag.to_s}")[prop_val.to_i]
        when :text
          source.search("[text()*='#{prop_val}']")
        when :xpath
          source.xpath(prop_val)
        else
          raise SupportError, "PageObjectPal doesn't support elements identified by '#{prop}'... yet. Consider ", 
            "forking the project at http://github.com/jdenen/page-object-pal."
        end

        raise PageObjectOutdated, "Could not identify '#{html_to_dsl(tag)}' where :#{prop} == '#{prop_val}'" if failure? match
      end
    end

    def failure?(match)
      match.to_a.empty?
    end

  end
end
