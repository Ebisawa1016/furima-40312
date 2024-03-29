class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number, :user_id, :item_id, :token
 
  with_options presence: true do
  validates :user_id
    
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :prefecture_id, numericality: { other_than: 1 }

  validates :phone_number, format: { with: /\A\d+\z/, message: "is invalid. Input half-width numbers" }, length: { minimum: 10, maximum: 11 }
  validates :prefecture_id, :city, :street_address, :item_id
  validates :token
  end
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end

