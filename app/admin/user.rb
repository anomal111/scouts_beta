ActiveAdmin.register User do
  menu :label => "Użytkownicy", :url => "/12_gustkiewicz/krajka/admin/users"
  
  actions :all, :change_role,  :except => [:edit, :create, :new]
  permit_params :login, :password, :password_confirmation, :email, :admin, :role, :address
  
  filter :login
  filter :email
  filter :role
  filter :created_at
  filter :last_login_at
  
  index do
    column :login
    column :email
    column 'Uprawnienia', :role
    actions defaults: false do |user|
      link_to 'Zmień uprawnienia', change_role_admin_user_path(user)
    end
    column :created_at
    column 'Ostatnie logowanie', :last_login_at
  end
  
  member_action :change_role, method: [:get, :post] do
  end

  controller do
    def change_role
      @user = User.find(params[:id])
    end
    
    def change_role
      @user = User.find(params[:id])
      if @user.role == 'klient'
        @rola = 'koordynator'
      else
        @rola = 'klient'
      end
      session[:return_to] ||= request.referer
      respond_to do |format|
        if @user.update_attributes(:role => @rola)
          format.html { redirect_to session.delete(:return_to), notice: 'Zmieniono uprawnienia użytkownikowi!' }
          format.json { head :no_content }
        end
      end
    end
  end
end