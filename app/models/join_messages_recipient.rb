class JoinMessagesRecipient < ApplicationRecord
  belongs_to :private_message
  belongs_to :recipient, polymorphic: true
end
