class Issue < ActiveRecord::Base
  has_many :order_positions
  attr_accessible :date, :mark, :title, :picture, :volume, :price
end
