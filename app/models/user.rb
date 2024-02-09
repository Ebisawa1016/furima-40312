class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, :last_name_kanji, :first_name_kanji, :last_name_katakana, :first_name_katakana, :date_birth, presence: true
end
