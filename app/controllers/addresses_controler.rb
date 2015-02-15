class AddressesController < InheritedResources::Base

  def new
    @address = Address.new
  end

  def edit
  end

  private

    def address_params
      params.require(:address).permit()
    end
end

