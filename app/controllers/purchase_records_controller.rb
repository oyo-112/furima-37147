class PurchaseRecordsController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!
  before_action :move_to_index
  before_action :sold_out

  def index
    @purchase_record_delivery_address = PurchaseRecordsDeliveryAddresses.new
  end

  def create
    @purchase_record_delivery_address = PurchaseRecordsDeliveryAddresses.new(purchase_record_params)
    if @purchase_record_delivery_address.valid?
      pay_item
      @purchase_record_delivery_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_records_delivery_addresses).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user.id
  end

  def sold_out
    redirect_to root_path if @item.purchase_record.present?
  end
end
