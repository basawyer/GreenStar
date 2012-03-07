class AddLabelToSlots < ActiveRecord::Migration
  def self.up
    add_column :slots, :label, :string
  end

  def self.down
    remove_column :slots, :label
  end
end
