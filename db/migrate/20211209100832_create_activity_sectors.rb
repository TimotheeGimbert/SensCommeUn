class CreateActivitySectors < ActiveRecord::Migration[6.1]
  def change
    create_table :activity_sectors do |t|
      t.string :name

      t.timestamps
    end
  end
end
