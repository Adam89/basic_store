class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items

  def total_price
    order_items.inject(0) {|s, i| s += i.total_price }
  end
end
