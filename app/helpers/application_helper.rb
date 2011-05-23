module ApplicationHelper
  def title
    base_title = "Elhu.me: "
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title.capitalize}"
    end
  end
end
