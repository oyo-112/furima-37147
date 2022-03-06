class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record

  validates :item_name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :condition_id, presence:true
  validates :shipping_cost_id, presence: true
  validates :shipping_day_id, presence: true
  validates :prefecture_id, presence: true
  validates :category_id, presence: true
  validates :user, presence: true
end
