class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :department

      t.timestamps
      t.references :user

    end
  end
end
