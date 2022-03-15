class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_one :purchase_record

  validates :image, presence: true
  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, presence:true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_cost_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true
  validates :user, presence: true

end
