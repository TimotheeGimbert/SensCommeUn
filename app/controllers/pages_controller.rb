class PagesController < ApplicationController

  def index
  end

  def presentation
  end

  def contact
    @visitor_message = VisitorMessage.new()
  end
  
end
