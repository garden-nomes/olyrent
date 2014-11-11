module ApplicationHelper

  # Generates a title for a page
  def page_title(title)
    base_title = "Olyrent"
    if title.empty?
      base_title
    else
      "#{base_title} | #{title}"
    end
  end
end
