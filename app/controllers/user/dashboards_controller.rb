class User::DashboardsController < ApplicationController
  def index
    redirect_to pages_news_path
  end
end