class PurchaseRecordController < ApplicationController
  def index
    @purchase_record_delivery_address = Purchase_recordsDelivery_addresses.new
  end

  def create
  
  end
end
