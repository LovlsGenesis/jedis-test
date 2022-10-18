class Resident < ApplicationRecord
  has_one :address
  has_one_attached :picture

  validates :full_name, :cpf, :cns, :email, :birth_date, :phone_number, presence: true
  validate :cpf_is_valid?, :email_is_valid?, :cns_is_valid?

  def cpf_is_valid?
    return errors.add(:cpf, 'CPF invalido') unless CPF.valid?(cpf)
  end

  def email_is_valid?
    return errors.add(:email, 'Email invalido') unless email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end

  def cns_is_valid?
    return errors.add(:cns, 'CNS invalido') unless cns.present? && cns.length == 15

    value = cns.split('').map(&:to_i).inject(0, :+)
    return errors.add(:cns, 'CNS invalido') unless (value % 11).zero?
  end
end
