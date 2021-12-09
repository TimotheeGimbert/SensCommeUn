class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :PrivateMessages, as: :author
  has_many :PrivateMessages, as: :recipient, through: :join_messages_recipients
end
