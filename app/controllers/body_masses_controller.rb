class BodyMassesController < ApplicationController
  def new
    @body_mass = BodyMass.new
  end

  def create
    @body_mass = BodyMass.new(body_mass_params)
    @body_mass.user_id = current_user.id
    if @body_mass.save!
      redirect_to body_mass_path(@body_mass)
    else
      render "new"
    end
  end

  def show
    @body_mass = BodyMass.find_by_id(params[:id])
  end

  private

  def body_mass_params
    params.require(:body_mass).permit(:weight, :height, :bmi)
  end
end
