class SlotsController < ApplicationController
  def change_power
    @slot = Slot.find_by_id(params[:id])
    if @slot.power
      @slot.power = false
    else
      @slot.power = true
    end
    @slot.save
    redirect_to "/outlets"
  end
end
