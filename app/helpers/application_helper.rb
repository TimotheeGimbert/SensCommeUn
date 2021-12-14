module ApplicationHelper
  def format_date(datetime)
    datetime.strftime("%m/%d/%Y")
  end
  def format_date_with_hour(datetime)
    datetime.strftime("%m/%d/%Y - %Hh%m")
  end
end
