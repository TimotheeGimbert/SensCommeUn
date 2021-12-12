class JoinMessagesRecipient < ApplicationRecord
  belongs_to :private_message, dependent: :destroy
  belongs_to :recipient, polymorphic: true
end
