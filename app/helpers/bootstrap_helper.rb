module BootstrapHelper
  def icon_fa(icon, text='')
    icon_tag = content_tag(:i, nil, class: "fa fa-fw fa-#{icon}").html_safe
    text.blank? ? icon_tag : icon_tag + ' ' + text
  end

  def bootstrap_class_for_flash(name)
    case name
    when 'notice'
      'success'
    when 'alert'
      'danger'
    else
      name
    end
  end
end
