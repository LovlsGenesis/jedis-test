class ResidentsController < ApplicationController
  before_action :set_resident, only: %i[show edit update destroy switch_status]

  def index
    if params[:search].present?
      @residents = Resident.joins(:address).where(
        'lower(addresses.city) LIKE ? OR lower(addresses.state) = ? OR residents.full_name LIKE ?',
        "%#{params[:search]}%".downcase, params[:search].downcase, "%#{params[:search]}%"
      ).includes(:address)
    else
      @residents = Resident.includes(:address).all
    end
  end

  def show; end

  def new
    @resident ||= Resident.new
    @resident.build_address
  end

  def create
    @resident = Resident.new(register_params)
    if @resident.save
      redirect_to residents_path
    else
      redirect_to action: :new
    end
  end

  def update
    if @resident.update(register_params)
      redirect_to residents_path
    else
      redirect_to action: :edit
    end
  end

  def edit; end

  def switch_status
    @resident.active = !@resident.active
    if @resident.save
      flash[:success] = 'Status alterado com sucesso!'
      redirect_to residents_path
    else
      flash[:error] = 'Não foi possivel alterar o status!'
    end

  end

  private

  def set_resident
    @resident = Resident.find(params[:id])
  end

  def register_params
    params.require(:resident)
          .permit(:full_name, :cpf, :cns, :email, :birth_date, :phone_number, :picture,
                  address_attributes: %i[id cep street neighborhood city state complement])
  end
end
