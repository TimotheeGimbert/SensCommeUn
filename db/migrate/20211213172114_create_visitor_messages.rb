class CreateVisitorMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :visitor_messages do |t|
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
