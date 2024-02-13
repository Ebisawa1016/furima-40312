class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|

      t.references :user,                    null: false,foreign_key: true
      t.text       :description,             null: false
      t.integer    :price,                   null: false
      t.string     :item_name,               null: false
      t.integer    :category_id,             null: false
      t.integer    :status_id,               null: false
      t.integer    :shipping_fee_burden_id,  null: false
      t.integer    :prefecture_id,           null: false
      t.integer    :shipping_duration_id,    null: false

      t.timestamps null: false
    end
  end
end
