class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :name, null: false
      t.text       :describe, null: false
      t.integer    :price, null: false
      t.references :user, null: false, foreign_key: true
      t.integer    :category_id, null: false
      t.integer    :condition_id, null: false
      t.integer    :deli_charge_id, null: false
      t.integer    :prefecture_id, null: false
      t.integer    :deli_time_id, null: false
      t.timestamps
    end
  end
end
