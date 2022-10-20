require 'rails_helper'

RSpec.describe ResidentsController, type: :controller do
  subject do
    Resident.new(
      full_name: 'full_name',
      cpf: '98835307066',
      cns: '187329617340002',
      email: 'test@test.com',
      phone_number: '11999999999',
      birth_date: Time.now - 26.years
    )
  end

  it 'should be able to create a resident' do
    full_name = 'Test Name'

    post :create, params: {
      resident: {
        full_name: full_name,
        cpf: '98835307066',
        cns: '187329617340002',
        email: 'test@test.com',
        phone_number: '11999999999',
        birth_date: Time.now - 26.years
      }
    }
    expect(Resident.first.full_name).to be == full_name
    expect(response).to redirect_to(residents_path)
  end

  it 'should be able to update a resident' do
    subject.save
    patch :update, params: {
      id: subject.id,
      resident: {
        full_name: 'Updated Name'
      }
    }

    expect(Resident.first.full_name).to be == 'Updated Name'
    expect(response).to redirect_to(residents_path)
  end
end
