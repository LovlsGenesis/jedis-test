class ResidentsController < ApplicationController
  before_action :set_resident, only: %i[ show edit update destroy ]

  def index
    @residents = Resident.all
  end

  def show

  end

  def new
    @resident = Resident.new
  end

  def create
    @resident = Resident.new(params[:resident])
  end

  def update

  end

  def edit

  end

  def destroy

  end

  private

  def set_resident
    @resident = Resident.find(params[:id])
  end

  def register_params
    params.require(:resident)
          .permit(:full_name, :cpf, :cns, :email, :birth_date, :phone_number)
  end
end
