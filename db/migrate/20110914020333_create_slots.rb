class CreateSlots < ActiveRecord::Migration
  def self.up
    create_table :slots do |t|
      t.string :position
      t.integer :unit_id

      t.timestamps
    end
  end

  def self.down
    drop_table :slots
  end
end
