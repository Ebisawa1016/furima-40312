class AddLastNameKatakanaToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :last_name_katakana, :string
  end
end
