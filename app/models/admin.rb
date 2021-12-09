class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_messages, as: :author, class_name: 'PrivateMessage'
  has_many :join_messages_recipients, as: :recipient
  has_many :received_messages, through: :join_messages_recipients, source: :private_message

  def private_messages
    sent_messages + received_messages
  end
end
