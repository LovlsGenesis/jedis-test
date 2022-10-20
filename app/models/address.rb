class Address < ApplicationRecord
  belongs_to :resident

  validates :cep, :street, :neighborhood, :city, :state, presence: true
end
