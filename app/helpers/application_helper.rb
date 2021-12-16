module ApplicationHelper
  def format_date(datetime)
    if datetime
      datetime.strftime("%m/%d/%Y")
    end
  end
  def format_date_with_hour(datetime)
    if datetime
      datetime.strftime("%m/%d/%Y - %Hh%m")
    end
  end
end
