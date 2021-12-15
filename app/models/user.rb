class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :external_stakeholders
  has_many :organizations, through: :external_stakeholders
  has_many :sent_messages, as: :author, class_name: 'PrivateMessage'
  has_many :join_messages_recipients, as: :recipient
  has_many :received_messages, through: :join_messages_recipients, source: :private_message
  has_many :legal_reps
  has_many :organizations, through: :legal_reps, as: :executive
  has_many :managed_organizations, through: :legal_reps, source: :organization
  has_many :stakeholder_requests
  has_many :organization_participation_requests, through: :stakeholder_requests, source: :organization

  def private_messages
    sent_messages + received_messages
  end
  
end
