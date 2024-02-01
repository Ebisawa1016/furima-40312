# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type     | Options                 |
| ------------------ | -------- | ----------------------- |
| last_name_kanji    | string   | null: false             |
| first_name_kanji   | string   | null: false             |
| last_name_katakana | string   | null: false             |
| first_name_katakana| string   | null: false             |
| email              | string   | null: false,unique: true|
|encrypted_password  | string   | null: false             |
| date_birth         | string   | null: false             |
| phone              | string   | null: false             |
| paymentInfo        | string   | null: false             |
| ProfileImage       | string   | null: false             |
| created_at         | datetime | null: false             |
| update_at          | datetime | null: false             |

  has_many :items
  has_many :addresses
  has_many :purchases

## Itemsテーブル:

| Column       | Type     | Options                     |
| ------------ | -------- | --------------------------- |
| id           | integer  | null: false, unique: true   |
| user_id      | integer  | null: false                 | 
| description  | string   | null: false                 | 
| price        | decimal  | null: false                 | 
| seller       | boolean  | null: false                 | 
| sold_at      | datetime | null: true                  |
| status       | string   | null: false                 |
| created_at   | datetime | null: false                 |
| updated_at   | datetime | null: false                 |

belongs_to :user
has_many :purchases

## Addressesテーブル:

| Column       | Type     | Options                     |
| ------------ | -------- | --------------------------- |
| postal_code    | string   | null: false               |
| prefecture     | string   | null: false               |
| city           | string   | null: false               |
| street_address | string   | null: false               |
| building_name  | string   |                           |
| phone_number   | string   | null: false       

belongs_to :user



## Purchasesテーブル 

| Column        | Type      | Options                   |
| ------------- | -------   | ------------------------- |
| item_id       | references| null: false               |
| buyer_id      | string    | null: false               |

  belongs_to :user
  belongs_to :item
