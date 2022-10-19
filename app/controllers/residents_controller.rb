class ResidentsController < ApplicationController
  before_action :set_resident, only: %i[ show edit update destroy ]

  def index
    @residents = Resident.all
  end

  def show; end

  def new
    @resident = Resident.new
    @resident.build_address
  end

  def create
    @resident = Resident.new(register_params)
    redirect_to residents_path if @resident.save
    puts "*" * 50
    puts @resident.save
    debugger
    puts "*" * 50
  end

  def update; end

  def edit; end

  private

  def set_resident
    @resident = Resident.find(params[:id])
  end

  def register_params
    params.require(:resident)
          .permit(:full_name, :cpf, :cns, :email, :birth_date, :phone_number,
                  address_attributes: %i[cep street neighborhood city state complement])
  end
end
