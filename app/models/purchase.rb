class Purchase < ApplicationRecord
  attr_accessor :price
  validates :price, presence: true
  validates :token, presence: true

end
