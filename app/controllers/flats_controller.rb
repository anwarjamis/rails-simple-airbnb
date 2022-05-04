class FlatsController < ApplicationController
  before_action :find_flat, only: %i[show create edit update destroy]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render 'edit'
    end
  end

  def destroy
    @flat.destroy
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end
end
