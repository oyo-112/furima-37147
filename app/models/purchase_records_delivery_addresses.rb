class PurchaseRecordsDeliveryAddresses
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :order, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true }
    validates :token
    validates :user_id
    validates :item_id
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
  
end