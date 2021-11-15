class ChangeDataTypeForBirthday < ActiveRecord::Migration[6.1]
  def change
      change_column(:users, :birthday, :datetime)
  end
end
