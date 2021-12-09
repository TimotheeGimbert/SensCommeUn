class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :nickname
      t.datetime :creation_date
      t.string :address
      t.string :address_complement
      t.string :zip_code
      t.references :city, null: false, foreign_key: true
      t.string :email
      t.string :phone_number
      t.references :status, null: false, foreign_key: true
      t.string :siren
      t.text :description
      t.references :activity_sector, null: false, foreign_key: true
      t.string :naf_ape
      t.string :logo_url
      t.string :website_url

      t.timestamps
    end
  end
end
