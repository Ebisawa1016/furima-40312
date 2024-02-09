class AddFirstNameKanjiToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name_kanji, :string
  end
end
