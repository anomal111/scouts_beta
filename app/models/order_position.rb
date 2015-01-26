class OrderPosition < ActiveRecord::Base
  belongs_to :issue
end
