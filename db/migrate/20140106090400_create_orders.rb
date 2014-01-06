class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :orderd_date
      t.integer :quanity
      t.decimal :price
      t.integer :user_id
      t.string :item_name
      t.decimal :discount
      t.timestamps
    end
  end
end
