require 'rails_helper'

RSpec.describe Resident, type: :model do
  it 'is valid with valid attributes' do
    expect(Resident.new).to be_valid
  end

  it 'is not valid without a full_name'
  it 'is not valid without a cpf'
  it 'is not valid without a cns'
  it 'is not valid without a email'
  it 'is not valid without a birth_date'
  it 'is not valid without a phone_number'
  it 'is not valid with an invalid cpf'
  it 'is not valid with an invalid cns'
  it 'is not valid with an invalid email'
end
