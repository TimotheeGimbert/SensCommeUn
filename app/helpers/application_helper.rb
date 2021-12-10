module ApplicationHelper
  def format_date(datetime)
    datetime.strftime("%m/%d/%Y")
  end
end
