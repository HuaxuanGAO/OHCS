class AddSlotRefToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_reference :appointments, :slot, null: false, foreign_key: true
  end
end
