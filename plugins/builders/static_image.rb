require_relative "../site_builder.rb"

class Builders::StaticImage < SiteBuilder
  def build
    liquid_tag :static_image, :static_image_tag, as_block: false
    liquid_tag :static_image_with_class, :static_image_with_class_tag, as_block: false
  end
  def static_image_tag(attributes, tag)
    items = attributes.split()
    format_image(*items)
  end
  def static_image_with_class_tag(attributes, tag)
    items = attributes.split()
    puts items
    format_image(*items)
  end
  def format_image(src = "", cls = "", alt = "")
    html = '<img '
    html += format_html_attr("src", src) + " "
    html += format_html_attr("class", cls) + " "
    html += format_html_attr("alt", alt)
    html += ">"
    puts html
    html
  end

  def format_html_attr(name, value)
    if value.start_with? '"' or value.start_with? "'"
      format_html_attr(name, value[1..])
    elsif value.end_with? "'" or value.end_with? '"'
      format_html_attr(name, value[..-1])
    else
      if name == "src"
        'src="' + "#{prepend_images_dir(value)}" + '"'
      else
        "#{name}=" + '"' + "#{value}" + '"'
      end
    end
  end

  def prepend_images_dir(path)
    "/_bridgetown/static/images/#{path}"
  end
end
