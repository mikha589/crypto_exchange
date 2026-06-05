class DashboardController < ApplicationController
before_action :authenticate_user!

  def index
    @wallets = current_user.wallets

    @order = current_user.orders.new
  end
end
