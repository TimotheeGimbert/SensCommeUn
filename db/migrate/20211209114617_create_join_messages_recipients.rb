class CreateJoinMessagesRecipients < ActiveRecord::Migration[6.1]
  def change
    create_table :join_messages_recipients do |t|
      t.references :private_message, null: false, foreign_key: true
      t.references :recipient, polymorphic: true, null: false

      t.timestamps
    end
  end
end
