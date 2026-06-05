class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :wallets, dependent: :destroy
  has_many :orders, dependent: :destroy

  after_create :create_default_wallets

  private
  def create_default_wallets
    wallets.create!(currency: "USD", balance: 10000.0)
    wallets.create!(currency: "BTC", balance: 0.0)
  end
end
