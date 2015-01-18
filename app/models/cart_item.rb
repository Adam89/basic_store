class CartItem
  attr_reader :quantity, :product_id

  delegate :price, :name, to: :product

  def initialize(product_id, quantity=1)
    @product_id = product_id
    @quantity = quantity
  end

  def increment
    @quantity += 1
  end

  def product
    @product ||= Product.find(product_id)
  end

  def total_price
    quantity * product.price
  end
end
