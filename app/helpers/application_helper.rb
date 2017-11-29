module ApplicationHelper

  def nav_filters
    if params[:controller] == "dashboards" && params[:action] == "show"
      true
    elsif params[:controller] == "registrations" && params[:action] == "new"
      true
    else
      false
    end
  end

  def price_format(price)
    string_price = price.to_s.reverse
    result = ""
    string_price.split('').each_slice(3).with_index do |slice, index|
      if index == 0
        result << "#{slice.flatten.join}"
      else
        result << ".#{slice.flatten.join}"
      end
    end
    result.reverse
  end
end
