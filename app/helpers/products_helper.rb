module ProductsHelper
  def image_link_to(image, options = {})
    link_to image do
      image_tag image, options
    end
  end

  def dl_item(term, description)
    case description
    when String
      return nil if description.blank?
      dd = content_tag(:dd, description)
    when Array
      return nil if description.empty?
      dd = content_tag(:dd) do
        content_tag(:ul, class: "list-inline") do
          description.map do |item|
            content_tag(:li, item)
          end.join.html_safe
        end
      end
    when Date
      dd = content_tag(:dd, description)
    when Fixnum
      dd = content_tag(:dd, "#{description / 60}.minutes")
    else
      return nil
    end
    [content_tag(:dt, term), dd].join.html_safe
  end
end
