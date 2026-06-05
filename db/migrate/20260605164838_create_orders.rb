class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :market, null: false
      t.integer :order_type, null: false, default: 0
      t.integer :side, null: false
      t.decimal :price, precision: 18, scale: 2, null: false
      t.decimal :quantity, precision: 18, scale: 8, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
