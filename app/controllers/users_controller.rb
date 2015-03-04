class UsersController < ApplicationController    
  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @user = User.new
    @user.build_address
  end

  def create
    @user = User.new(params[:user])

    # Saving without session maintenance to skip
    # auto-login which can't happen here because
    # the User has not yet been activated
    if @user.save
      flash[:notice] = "Konto utworzono pomyślnie!"
      redirect_to root_url
    else
      flash[:alert] = "Wystąpił problem, spróbuj ponownie później."
      render :action => :new
    end

  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Konto zmodyfikowano pomyślnie."
      redirect_to root_url
    else
      render :action => :edit
    end
  end
  
  def my_orders
    @orders = Order.all.select { |order| order.user_id == current_user.id }
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    #def user_params
      #params.require(:user).permit(:login, :password, :password_confirmation, :email)
      #end
    def user_params
      params.require(:user).permit(:login, :password, :role, :admin, :email, address_attributes: [:id, :name, :surname, :street, :house_number, :apartment_number, :city, :zip_code])
    end

end