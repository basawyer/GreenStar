class CreateDataPoints < ActiveRecord::Migration
  def self.up
    create_table :data_points do |t|
      t.integer :val
      t.datetime :timestamp
      t.integer :socket_id

      t.timestamps
    end
  end

  def self.down
    drop_table :data_points
  end
end
