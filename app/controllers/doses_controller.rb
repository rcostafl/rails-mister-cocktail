# frozen_string_literal: true

# Doses controller
class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_parameters)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to(cocktail_path(@cocktail))
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail, notice: 'Dose was sucessfully destroyd')
  end

  private

  def dose_parameters
    params.require(:dose).permit(%i[description ingredient_id])
  end
end
