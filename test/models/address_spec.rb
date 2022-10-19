require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'is valid with valid attributes' do
    expect(Address.new).to be_valid
  end

  it 'is not valid without a cep'
  it 'is not valid without a street'
  it 'is not valid without a neighborhood'
  it 'is not valid without a city'
  it 'is not valid without a state'
end
