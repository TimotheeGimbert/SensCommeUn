class ExternalStakeholderAdd < ActiveRecord::Migration[6.1]
  def change
    add_reference :external_stakeholders, :user, index: true
  end
end
