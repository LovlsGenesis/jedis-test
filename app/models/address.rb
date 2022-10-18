class Address < ApplicationRecord
  belongs_to :resident

  validates :cep, :street, :neighborhood, :city, :state, :street, presence: true

  # :complement :ibge
end
