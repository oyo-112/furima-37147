class PurchaseRecordsController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_record_delivery_address = PurchaseRecordsDeliveryAddresses.new
  end

  def create
    @purchase_record_delivery_address = PurchaseRecordsDeliveryAddresses.new(purchase_record_params)
    if @purchase_record_delivery_address.valid?
      @purchase_record_delivery_address.save
      redirect_to root_path
    else
        render :index
    end
  end

  private
    def purchase_record_params
      params.require(:purchase_records_delivery_addresses).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

end
