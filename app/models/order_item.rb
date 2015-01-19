class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  delegate :name, :price, to: :product

  def total_price
    quantity * price
  end
end
