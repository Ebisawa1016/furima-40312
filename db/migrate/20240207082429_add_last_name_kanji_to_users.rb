class AddLastNameKanjiToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :last_name_kanji, :string
  end
end
