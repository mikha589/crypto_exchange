class Trade < ApplicationRecord
  belongs_to :buy_order, class_name: "Order"
  belongs_to :sell_order, class_name: "Order"

  validates :price, :quantity, :market, presence: true
  validates :price, :quantity, numericality: { greater_than: 0 }
end
