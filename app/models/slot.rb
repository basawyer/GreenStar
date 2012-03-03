class Slot < ActiveRecord::Base
  belongs_to :unit
  has_many :data_points
end
