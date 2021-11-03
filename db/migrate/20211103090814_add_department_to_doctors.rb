class AddDepartmentToDoctors < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :department, :string
  end
end
