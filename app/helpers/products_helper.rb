module ProductsHelper
  def image_link_to(image, link_options = {}, image_options = {})
    link_to image, link_options do
      image_tag image, image_options
    end
  end

  def product_spec(term, description = nil, icon = nil, &block)
    description, icon = yield, description if block_given?
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

  def current_user_rating(product)
    return 0 unless user_signed_in?
    review = product.reviews.find_by(user: current_user)
    review ? review.rating : 0
  end

  def table_row_class(rating)
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
end
