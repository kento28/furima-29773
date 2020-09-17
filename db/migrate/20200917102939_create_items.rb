class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,     null: false, foreign_key: true
      t.string     :name,     null: false
      t.text       :text,     null: false
      t.integer    :category, null: false
      t.integer    :state,    null: false
      t.integer    :postage,  null: false
      t.integer    :region,   null: false
      t.integer    :shipping_days, null: false
      t.integer    :price,    null: false

      t.timestamps
    end
  end
end
