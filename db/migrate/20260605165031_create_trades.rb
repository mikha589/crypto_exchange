class CreateTrades < ActiveRecord::Migration[7.1]
  def change
    create_table :trades do |t|
      t.integer :buy_order_id, null: false
      t.integer :sell_order_id, null: false
      t.decimal :price, precision: 18, scale: 2, null: false
      t.decimal :quantity, precision: 18, scale: 8, null: false
      t.string :market, null: false

      t.timestamps
    end

    add_index :trades, :buy_order_id
    add_index :trades, :sell_order_id
  end
end
