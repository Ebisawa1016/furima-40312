class AddDateBirthToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :date_birth, :date
  end
end
