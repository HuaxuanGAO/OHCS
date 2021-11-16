class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :med_record
      t.timestamps
      t.references :user

    end
  end
end
