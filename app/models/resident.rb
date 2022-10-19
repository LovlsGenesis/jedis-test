class Resident < ApplicationRecord
  include Cns

  has_one :address
  has_one_attached :picture
  accepts_nested_attributes_for :address

  validates :full_name, :cpf, :cns, :email, :birth_date, :phone_number, presence: true
  validate :cpf_is_valid?, :email_is_valid?, :cns_is_valid?

  after_create :send_welcome

  def cpf_is_valid?
    return errors.add(:cpf, 'CPF invalido') unless CPF.valid?(cpf)
  end

  def email_is_valid?
    return errors.add(:email, 'Email invalido') unless email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end

  def cns_is_valid?
    Cns.validate(cns)
  end

  def send_welcome
    Thread.new do
      ApplicationMailer.welcome(@resident).deliver
      # Send SMS
    end

  end
end
