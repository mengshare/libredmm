module ProductsHelper
  def image_link_to(image, link_options = {}, image_options = {})
    link_to image, link_options do
      image_tag image, image_options
    end
  end

  def dl_item(term, description)
    return nil if description.blank?
    case description
    when Array
      description = content_tag(:ul, class: "list-inline") do
        description.map do |item|
          content_tag(:li, item)
        end.join.html_safe
      end
    when Fixnum
      description = distance_of_time(description)
    end
    (content_tag(:dt, term) + content_tag(:dd, description)).html_safe
  end
end
