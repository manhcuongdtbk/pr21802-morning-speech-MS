module ApplicationHelper
  include Pagy::Frontend

  def full_title page_title = ""
    base_title = "Morning Speech Management System"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
