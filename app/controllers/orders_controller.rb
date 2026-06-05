class OrdersController < ApplicationController
  before_action :authenticate_user!
  def create
    @order = current_user.orders.new(order_params)

    @order.market = "BTC_USD"
    @order.status = :pending

    if @order.save
      redirect_to root_path, notice: "Ордер на #{ @order.side == 'buy' ? 'покупку' : 'продажу' } успешно размещен!"
    else
      redirect_to root_path, alert: @order.errors.full_messages.to_sentence
    end
  end

  private
  def order_params
    params.require(:order).permit(:side, :price, :quantity)
  end
end
