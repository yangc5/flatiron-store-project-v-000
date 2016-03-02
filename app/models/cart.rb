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
    line_item = line_items.find_by(item_id: item_id, cart_id: self.id) || line_items.build(item_id: item_id, cart_id: self.id)
    if line_item.persisted?
      line_item.quantity += 1
    end
    line_item.save
    return line_item
  end
end
