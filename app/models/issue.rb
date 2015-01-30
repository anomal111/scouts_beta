class Issue < ActiveRecord::Base
  #has_many :order_positions
  has_many :order_items
  attr_accessible :date, :mark, :title, :picture, :volume, :price
  has_attached_file :picture, 
                    :styles => { :medium => "300x300>", :thumb => "100x100>", :big => "800x800" }, 
                    :default_url => "/images/:style/missing.png",
                    :url => "/images/:style/:basename.:extension"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  default_scope { where(active: true) }
end
