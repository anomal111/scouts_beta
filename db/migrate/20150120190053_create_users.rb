class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      #t.string :login
      #t.string :email
      #t.string :name
      #t.string :surname
      #t.string :city
      #t.string :street
      #t.string :building
      #t.string :apartment
      #t.string :zip
      #t.string :email
      #t.string :crypted_password
      #t.boolean :admin
      #t.string :persistence_token

      t.timestamps
      
      t.string    :name,                :null => false, :default => ''
      t.string    :surname,             :null => false
      t.string    :login,               :null => false
      t.string    :crypted_password,    :null => false
      t.string    :password_salt,       :null => false
      t.string    :city,                :null => false
      t.string    :street,              :null => false
      t.string    :building,            :null => false
      t.string    :apartment
      t.string    :zip,                 :null => false
      t.string    :email,               :null => false
      t.string    :persistence_token,   :null => false
      t.string    :single_access_token, :null => false
      t.string    :perishable_token,    :null => false
      t.boolean   :admin, :defaut => false                   

      t.integer   :login_count,         :null => false, :default => 0
      t.integer   :failed_login_count,  :null => false, :default => 0
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip                                           

      t.timestamps
    end
  end
end
