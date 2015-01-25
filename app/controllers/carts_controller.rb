class CartsController < ApplicationController
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
    @client_token = Braintree::ClientToken.generate
  end
end
