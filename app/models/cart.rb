class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    line_items.each do |line_item|
      total += line_item.item.price * line_item.quantity
    end
    return total
  end

  def add_item(item_id)
    line_item = LineItem.find_by(item_id: item_id, cart_id: self.id) || LineItem.new(item_id: item_id, cart_id: self.id)
    if line_item.persisted?
      line_item.quantity += 1
    end
    return line_item
  end
end
