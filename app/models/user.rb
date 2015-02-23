class User < ActiveRecord::Base
  #attr_protected :admin
  #acts_as_authentic do |config|
    #config.crypted_password_field = :crypted_password
    #config.require_password_confirmation = true
    #end
    
  has_one :address, :as => :shipping
  accepts_nested_attributes_for :address
    
  acts_as_authentic do |c|
     c.login_field = 'login'
  end # block optional
  
  ROLES = %i[klient koordynator]
  
  attr_accessible :login, :password, :password_confirmation, :email, :role
  attr_accessible :address_attributes
  
  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
end
