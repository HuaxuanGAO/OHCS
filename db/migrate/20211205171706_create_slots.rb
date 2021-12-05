class CreateSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :slots do |t|
      t.boolean :available, default: true
      t.datetime :start_time
      t.datetime :end_time
      t.references :schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
