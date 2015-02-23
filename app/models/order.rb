class Order < ActiveRecord::Base
  has_many :order_items
  has_one :address, :as => :shipping
  accepts_nested_attributes_for :address
  attr_accessible :address_attributes, :payment, :status, :user_id
  
  before_create :set_order_status
  before_save :update_subtotal
  before_save :update_shipping
  before_save :update_total
  
  STATUSES = %i[oczekujące w_realizacji zapłacone zrealizowane]
   
  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
  private
    def set_order_status
      self.status = 'oczekujące'
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
