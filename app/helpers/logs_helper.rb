module LogsHelper
  def contextual_log_class(key)
    case key
    when 'Error Report'
      'warning'
    else
      nil
    end
  end
end
