class UnitsController < ApplicationController
  require 'json'

  def submit
    u = Unit.find_by_uid(params[:unit])

    if u
      slot = u.get_slot(params[:socket_num])
      if slot
      slot[0].data_points.create(:val => params[:value], :timestamp => params[:timestamp])
      else
        unit.slots.create(:position => params[:socket_num])
        slot = unit.get_slot(params[:socket_num])
        slot[0].data_points.create(:val => params[:value], :timestamp => params[:timestamp])
      end
    else
      unit = Unit.new
      unit.uid = params[:unit]
      unit.save
      unit.slots.create(:position => params[:socket_num])
      slot = unit.get_slot(params[:socket_num])
      slot[0].data_points.create(:val => params[:value], :timestamp => params[:timestamp])
    end

    
    @slot = u.get_slot(params[:socket_num])
    if !@slot[0].power
    render :inline => "PENII"
    else
      render :inline => "BUTTS"
    end
  end

  def get_latest
    u = Unit.find(params[:unit])
    s = u.get_slot(params[:slot])
    
    if s.id == 0 || s.id == 1 || s.id == 2 || s.id == 3
    	@dp = DataPoint.new
    	@dp.val = 30+rand(30)
    	@dp.timestamp = Time.now
    	@dp.slot_id = s.id
    	@dp.save
    	render :json => @dp
    else   
    	render :json => s.data_points.last
    end
  end
  
end
  
