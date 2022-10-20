require 'rails_helper'

RSpec.describe Address, type: :model do
  subject do
    described_class.new(
      cep: '05407000',
      street: 'Cardeal Arcoverde',
      neighborhood: 'Pinheiros',
      city: 'São Paulo',
      state: 'SP',
      resident: Resident.new
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a resident' do
    subject.resident = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a cep' do
    subject.cep = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a street' do
    subject.street = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a neighborhood' do
    subject.neighborhood = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a city' do
    subject.city = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a state' do
    subject.state = nil
    expect(subject).to_not be_valid
  end
end
