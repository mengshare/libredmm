module ProductsHelper
  def image_link_to(image, link_options = {}, image_options = {})
    image_options.reverse_merge!(ref: 'noreferer')
    link_to image, link_options do
      image_tag image, image_options
    end
  end

  def product_spec(term, description = nil, icon = nil, &block)
    return nil if description.blank?
    case description
    when Array
      description = content_tag(:ul, class: 'list-unstyled') do
        description.map do |item|
          content_tag(:li) do
            icon_fa(icon, item)
          end
        end.join.html_safe
      end
    else
      description = icon_fa(icon, description)
    end
    (content_tag(:dt, term) + content_tag(:dd, description)).html_safe
  end
end
