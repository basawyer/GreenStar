class Unit < ActiveRecord::Base
  belongs_to :user
  has_many :slots

  def get_slot(id)
    self.slots.each do |s|
      if s.position == id
        return s
      end
    end
  end
  
end
