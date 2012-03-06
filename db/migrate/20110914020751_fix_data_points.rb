class FixDataPoints < ActiveRecord::Migration
  def self.up
    remove_column :data_points, :socket_id
    change_table :data_points do |t|
      t.integer :slot_id
    end

  end

  def self.down
  end
end
