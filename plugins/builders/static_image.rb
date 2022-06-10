require_relative "../site_builder.rb"

class Builders::StaticImage < SiteBuilder
  def build
    liquid_tag :static_image, :static_image_tag, as_block: false
    liquid_tag :static_image_with_class, :static_image_with_class_tag, as_block: false
  end
  def static_image_tag(attributes, tag)
    items = get_arguments(attributes)
    format_image(*items)
  end
  def static_image_with_class_tag(attributes, tag)
    items = get_arguments(attributes)
    format_image(*items)
  end
  def format_image(src = "", cls = "", alt = "")
    html = '<img '
    html += format_html_attr("src", src) + " "
    html += format_html_attr("class", cls) + " "
    html += format_html_attr("alt", alt)
    html += ">"
    html
  end

  def format_html_attr(name, value)
    if value.empty?
      return "#{name}=" + '""'
    end
    if name == "src"
      "#{name}=" + '"' + "#{prepend_images_dir(value)}" + '"'
    else
      "#{name}=" + '"' + "#{value}" + '"'
    end
  end

  def prepend_images_dir(path)
    "/_bridgetown/static/images/#{path}"
  end
  def get_arguments(attribute_string)
    if attribute_string.empty? or attribute_string.nil?
      return Array.new
    end
    format = /(?<=")[^\"].+?(?=")/
    r = attribute_string.scan(format)
    return r.map { |s| s.gsub('"', '').strip }
  end
end
