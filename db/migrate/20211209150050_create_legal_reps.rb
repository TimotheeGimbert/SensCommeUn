class CreateLegalReps < ActiveRecord::Migration[6.1]
  def change
    create_table :legal_reps do |t|
      t.references :user, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
