class CartsController < ApplicationController
  def show
    @order = Order.new(order_item_ids: session[:cart],
                       coupon_id: session[:coupon])
  end

  def update
    session[:coupon] = coupon.id if coupon

    redirect_to cart_path, notice: coupon ? 'Coupon applied' : 'Invalid coupon'
  end

  private

  def coupon
    @coupon ||= Coupon.find_by(active: true, code: params[:code])
  end
end
