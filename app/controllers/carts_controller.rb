class CartsController < ApplicationController
  before_filter :initialize_cart

  def add
    @cart.add_item params[:id]
    session["cart"] = @cart.serialize
    product = @cart.items.first.product.name

    redirect_to :back, notice: "Added #{product} to cart"
  end

  def show
  end

  def checkout
    @order_form = OrderForm.new(
      user: User.new,
    )
  end
end
