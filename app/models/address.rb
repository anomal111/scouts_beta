class Address < ActiveRecord::Base
  
  attr_accessible :name, :surname, :street, :house_number, :apartment_number, :zip_code, :city, :order_id
  belongs_to :order, :polymorphic => true

  validates :name, presence: true
  validates :surname, presence: true
  validates :street, presence: true
  validates :house_number, presence: true, format: { with: /\A[0-9]+[a-zA-Z]?\z/,
                                                    message: "Zły format np. 12,12" }
  #validates :apartment_number, presence: true, numericality: true

  validates :zip_code, presence: true, format: { with: /\A[0-9]{2}-[0-9]{3}\z/,
                                              message: "Zły format np. 00-000" }
  validates :city, presence: true

end
