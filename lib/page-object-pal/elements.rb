module PageObjectPal
  module Elements

    def parse_methods(methods, path)
      elements = []
      methods.each do |meth|
        File.open(path).read.each_line do |line|
          next unless line.include? meth.to_s
          next unless line.lstrip.start_with? "div", "image", "link", "list_item", "ordered_list", "paragraph", "radio_button", "span", "text_area", "text_field", "unordered_list"
          elements << parse_element(line.lstrip)
        end
      end
      elements
    end

    def parse_element(string)
      tag = dsl_to_html(string[/^(\w+)/])
      sym = string[/:class|:id|:index|:text|:xpath/].gsub(":","").to_sym
      val = string[/"(.+)"|\d+/].to_s.gsub("\"", "")
      { tag => { sym => val } }
    end

    def dsl_to_html(anchor)
      case anchor
      when "image" then :img
      when "link" then :a
      when "list_item" then :li
      when "ordered_list" then :ol
      when "paragraph" then :p
      when "radio_button" then :radio
      when "text_area" then :input
      when "text_field" then :input
      when "unordered_list" then :ul
      else anchor.to_sym
      end
    end

    def html_to_dsl(anchor)
      case anchor
      when :img then "image"
      when :a then "link"
      when :li then "list_item"
      when :ol then "ordered_list"
      when :p then "paragraph"
      when :radio then "radio_button"
      when :input then "text_field/text_area"
      when :ul then "unordered_list"
      else anchor.to_s
      end
    end

  end
end
