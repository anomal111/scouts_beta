class User < ActiveRecord::Base
  #attr_protected :admin
  #acts_as_authentic do |config|
    #config.crypted_password_field = :crypted_password
    #config.require_password_confirmation = true
    #end
  acts_as_authentic do |c|
     c.login_field = 'login'
  end # block optional
  
  attr_accessible :login, :password, :password_confirmation, :email, :name, :surname, :city, :building, :apartment, :zip, :street
end
