class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def new
    @power = Power.new
    render :new
  end

  def create
    @power = Power.create(power_params)
    if @power.valid?
      redirect_to @power
    else
      render :new
    end
  end

  def show
    @power = Power.find(params[:id])
    render :show
  end

  def edit
    @power = Power.find(params[:id])
    render :edit
  end

  def update
    @power = Power.find(params[:id])
    @power.update(power_params)
    redirect_to @power
  end

  def destroy
    @power = Power.find(params[:id])
    @power.destroy
    redirect_to @powers
  end

  private
  def power_params
    params.require(:power).permit(:name, :description)
  end
end
