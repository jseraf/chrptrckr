module ApplicationHelper
  include Pagy::Frontend

  def page_title_tag page_title_text
    " | #{page_title_text}" unless page_title_text.empty?
  end

  def format_date_time time
    time.strftime("%-m/%d/%y at %l:%M%P")
  end
end
