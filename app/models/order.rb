class Order < ActiveRecord::Base
  belongs_to :order_status
  has_many :order_items
  has_one :address
  accepts_nested_attributes_for :address
  
  before_create :set_order_status
  before_save :update_subtotal
  before_save :update_shipping
  before_save :update_total
  
  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
  private
    def set_order_status
      self.order_status_id = 1
    end

    def update_subtotal
      self[:subtotal] = subtotal
    end
    
    def update_shipping
      self.shipping = 5.00
    end
    
    def update_total
      self.total = subtotal + self.shipping
    end
end
