class UnitsController < ApplicationController
  require 'json'

  def submit
    u = Unit.find_by_uid(params[:unit])
    reply = String(u.uid) + "="
    
    if u
    	s = 0
    	params.keys.each do |k|
    		next if k == "unit"    	
    		@val = params[k]
    		sl = u.slots[s]
    		if sl
    			@dp = DataPoint.new
				@dp.val = @val
				@dp.slot_id = sl.id
				@dp.timestamp = Time.now
				@dp.save
				
				if sl.power
					reply = reply + "0"
				else
					reply = reply + "1"
				end
				
			end
			s = s + 1
    	end
    end
    		
    render :inline => reply
    		

  end

  def get_latest
    s = Slot.find(params[:slot])
    
    # if s.id == 0 || s.id == 1 || s.id == 2 || s.id == 3
#     	@dp = DataPoint.new
#     	@dp.val = 30+rand(30)
#     	@dp.timestamp = Time.now
#     	@dp.slot_id = s.id
#     	@dp.save
#     	render :json => @dp
#     else   
	if s
    	render :json => s.data_points.last
    end
  end
  
  
  
end
  
