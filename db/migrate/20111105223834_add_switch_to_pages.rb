class AddSwitchToPages < ActiveRecord::Migration
  def self.up
    add_column :slots, :power, :boolean
  end

  def self.down
  end
end
