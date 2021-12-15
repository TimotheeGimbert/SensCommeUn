class PagesController < ApplicationController

  def index
  end

  def presentation
  end

  def contact
    @visitor_message = VisitorMessage.new()
  end

  def news
    @view_title_section1 = "Dernières organisations référencées sur la plateforme"
    @organizations = Organization.all.sort {|a, b| b.created_at <=> a.created_at}.first(3)
    @view_title_section2 = "Mes derniers messages reçus"
    @received_messages = current_user.received_messages.sort {|a, b| b.created_at <=> a.created_at}.first(3)
    @render_view = "user/partials/news/index"
  end
  
end
