class CreateSockets < ActiveRecord::Migration
  def self.up
    create_table :sockets do |t|
      t.integer :position
      t.integer :unit_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sockets
  end
end
