class CreateStakeholderRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :stakeholder_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true
      t.text :message
      t.boolean :validation

      t.timestamps
    end
  end
end
