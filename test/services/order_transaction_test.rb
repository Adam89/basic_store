require 'test_helper'

class OrderTransactionTest < MiniTest::Test
  def test_creates_a_transaction
    product = Product.new(name: 'Buyapowa', price: 10)
    order = Order.new
    order.order_items << OrderItem.new(product: product, quantity: 2)
    nonce = Braintree::Test::Nonce::Transactable
    transaction = OrderTransaction.new(order, nonce)

    transaction.execute

    assert transaction.ok?, 'Expected transaction to be successful.'
  end
end
