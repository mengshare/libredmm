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

  def contextual_rating_class(rating)
    case rating
    when 1
      'danger'
    when 2
      'warning'
    when 4, 5
      'success'
    else
      nil
    end
  end

  def rating_badge_span(product, options = {})
    rating = product.average_rating
    return nil unless rating
    options[:class] ||= ''
    options[:class] = [ options[:class], 'label label-success' ].join(' ')
    content_tag :span, "Average: #{rating}", options
  end

  def link_to_products_with_filter(options, text = nil)
    text ||= options.values.first
    link_to(text, products_path(options)) if text
  end
end
