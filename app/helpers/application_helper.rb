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
end
