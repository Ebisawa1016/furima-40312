class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee_burden
  belongs_to :prefecture
  belongs_to :shipping_duration
  belongs_to :user
 

  validates :image, presence: true
  validates :price, numericality: { only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  validates :description, :price, :item_name, presence: true
  validates :category_id, :status_id, :shipping_fee_burden_id, :prefecture_id, :shipping_duration_id, numericality: { other_than: 1 }
  
end