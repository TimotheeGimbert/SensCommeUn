class CreateExternalStakeholders < ActiveRecord::Migration[6.1]
  def change
    create_table :external_stakeholders do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.references :stakeholder_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
