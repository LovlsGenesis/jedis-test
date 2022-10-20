require 'rails_helper'

RSpec.describe Resident, type: :model do
  subject do
    described_class.new(
      full_name: 'full_name',
      cpf: '98835307066',
      cns: '187329617340002',
      email: 'test@test.com',
      phone_number: '11999999999',
      birth_date: Time.now
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a full_name' do
    subject.full_name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a cpf' do
    subject.cpf = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a phone_number' do
    subject.phone_number = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with invalid cpf' do
    subject.cpf = '99999999999'
    expect(subject).to_not be_valid
  end

  it 'is not valid with invalid cns' do
    subject.cns = '999999999999999'
    expect(subject).to_not be_valid
  end

  it 'is not valid with invalid birth_date' do
    subject.birth_date = DateTime.now + 2.years
    expect(subject).to_not be_valid
  end
end
