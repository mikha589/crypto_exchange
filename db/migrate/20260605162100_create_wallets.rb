class CreateWallets < ActiveRecord::Migration[8.1]
  def change
    create_table :wallets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :currency
      t.decimal :balance, precision: 18, scale: 8, default: 0.0, null: false

      t.timestamps
    end

    add_index :wallets, [ :user_id, :currency ], unique: true
  end
end
