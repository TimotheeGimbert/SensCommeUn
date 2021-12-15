class PrivateMessage < ApplicationRecord
  validates :object, :content, presence: true

  belongs_to :author, polymorphic: true

  has_many :join_messages_recipients, dependent: :destroy
  has_many :recipients_user, through: :join_messages_recipients, source: :recipient, source_type: "User"
  has_many :recipients_admin, through: :join_messages_recipients, source: :recipient, source_type: "Admin"
  
  def recipients
    recipients_admin + recipients_user
  end
end
