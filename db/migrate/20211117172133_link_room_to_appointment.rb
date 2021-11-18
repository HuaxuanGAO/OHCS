class LinkRoomToAppointment < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :appointment_id, :integer
  end
end
