class Cart
  attr_reader :items

  def self.build_from_hash(session_hash)
    items = session_hash["cart"]["items"].map do |item_data|
      CartItem.new(
        item_data["product_id"],
        item_data["quantity"],
      )
    end

    new(items)
  end

  def initialize(items = [])
    @items = items
  end

  def add_item(product_id)
    if item = item_present?(product_id)
      item.increment
    else
      @items << CartItem.new(product_id)
    end
  end

  def empty?
    @items.empty?
  end

  def serialize
    {
      "cart" => {
        "items" => serialize_items
      }
    }
  end

  private

  def serialize_items
    items.map do |item|
      {
        "product_id" => item.product_id,
        "quantity"   => item.quantity,
      }
    end
  end

  def item_present?(product_id)
    @items.find { |item| item.product_id == product_id }
  end
end
