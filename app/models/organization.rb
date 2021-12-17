class Organization < ApplicationRecord
  validates :name, :creation_date, :email, :siren, :description, :naf_ape, :phone_number, presence: true
  validates :nickname, length: {maximum: 12}
  validates :phone_number, format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/, message: "Numéro non valide en France" } 
  validate :true_siren?
  validate :true_naf_ape?


  belongs_to :city
  belongs_to :status
  belongs_to :activity_sector
  has_many :legal_reps, dependent: :destroy
  has_many :managers, through: :legal_reps, source: :user
  has_many :external_stakeholders, dependent: :destroy
  has_many :users_stakeholders, through: :external_stakeholders, source: :user
  has_many :activities
  has_many :stakeholder_requests, dependent: :destroy
  has_many :stakeholder_demands, through: :stakeholder_requests, source: :user
  has_one_attached :logo


  def true_siren?
    if siren.length !=9 || siren.to_i == 0
      errors.add(:siren, "Le siren renseigné ne respecte pas le bon format de 9 chiffres")
    end
  end
  def true_naf_ape?
    if naf_ape.length == 5
      0..3.times do |n|
        unless naf_ape[n].match?(/[A-Za-z]/)
          puts "#"*50
          puts naf_ape[n]
          errors.add(:naf_ape, "Le code naf/ape renseigné ne respecte pas le bon format de 4 lettre et 1 chiffre")
        end
      end
      unless naf_ape[4].match?(/[[:digit:]]/) 
        errors.add(:naf_ape, "Le code naf/ape renseigné ne respecte pas le bon format de 4 lettre et 1 chiffre")
      end
    else
      errors.add(:naf_ape, "Le code naf/ape renseigné ne respecte pas le bon format de 4 lettre et 1 chiffre")
    end
  end
end
