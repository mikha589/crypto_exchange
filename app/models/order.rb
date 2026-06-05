class Order < ApplicationRecord
  belongs_to :user

  enum :order_type, { limit: 0, market: 1 }
  enum :side, { buy: 0, sell: 1 }
  enum :status, { pending: 0, completed: 1, canceled: 2 }

  validates :market, :quantity, :price, presence: true
  validates :price, :quantity, numericality: { greater_than: 0 }
  validate :ensure_sufficient_balance, on: :create

  private
  def ensure_sufficient_balance
    if side == "buy"
      needed_amount = price * quantity
      usd_wallet = user.wallets.find_by(currency == "USD")

      if usd_wallet.nil? || usd_wallet.balance < needed_amount
        errors.add(:base, "Недостаточно баланса в USD. Требуется: $#{needed_amount}")
      end
    elsif side == "sell"
      btc_wallet = user.wallets.find_by(currency == "BTC")
      if btc.wallet.nil? || btc_wallet.balance < quantity
        errors.add(:base, "Недостаточно BTC для продажи. У вас есть: #{btc_wallet&.balance || 0}")
      end
    end
  end
end
