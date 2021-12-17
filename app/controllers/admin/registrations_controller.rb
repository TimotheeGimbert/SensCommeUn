class Admin::RegistrationsController < Devise::RegistrationsController
  before_action :has_admin_rights?, only: %i[ new edit create update destroy ]

  def new
    super 
  end

  def create
    super
  end

end
