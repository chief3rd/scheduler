class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.date :startDate
      t.date :endDate
      t.time :startTime
      t.time :endTime
      t.integer :supporter_id

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
