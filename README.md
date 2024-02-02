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
| date_birth         | date     | null: false             |
| phone              | string   | null: false             |
| paymentInfo        | string   | null: false             |
| created_at         | datetime | null: false             |
| update_at          | datetime | null: false             |

  has_many :items
  has_many :purchases

## Itemsテーブル:

| Column               | Type        | Options                     |
| ---------------------| --------    | --------------------------- |
| user                 | references  | null: false,,unique: true   | 
| description          | string      | null: false                 | 
| price                | integer     | null: false                 | 
| item_status          | string      | null: false                 |
| shipping_fee_burden  | string      | null: false                 |
| shipping_area        | string      | null: false                 |
| ishipping_duration   | string      | null: false                 |

belongs_to :user
has_many :purchases

## Addressesテーブル:

| Column       | Type     | Options                     |
| ------------ | -------- | --------------------------- |
| postal_code    | string   | null: false               |
| prefecture     | string   | null: false               |
| city           | string   | null: false               |
| street_address | string   | null: false               |
| building_name  | string   | null: false               |
| phone_number   | string   | null: false               |

belongs_to :user



## Purchasesテーブル 

| Column        | Type      | Options                                     |
| ------------- | --------- | ------------------------------------------- |
| item_id       | references| null: false,foreign_key: true               |
| buyer_id      | string    | null: false,foreign_key: true               |

  belongs_to :user
  belongs_to :item
