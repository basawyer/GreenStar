class Slot < ActiveRecord::Base
  belongs_to :unit
  has_many :data_points
  
  before_save :default_values
  def default_values
    self.label ||= '<ChangeMe>'
  end
  
end
