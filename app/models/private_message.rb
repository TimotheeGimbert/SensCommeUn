class PrivateMessage < ApplicationRecord
  belongs_to :author, polymorphic: true

  has_many :join_messages_recipients
  has_many :recipients_user, through: :join_messages_recipients, source_type: "User"
  has_many :recipients_admin, through: :join_messages_recipients, source_type: "Admin"
end
