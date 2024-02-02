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
| nickname           | string   | null: false             |
| last_name_kanji    | string   | null: false             |
| first_name_kanji   | string   | null: false             |
| last_name_katakana | string   | null: false             |
| first_name_katakana| string   | null: false             |
| email              | string   | null: false,unique: true|
| encrypted_password | string   | null: false             |
| date_birth         | date     | null: false             |

  has_many :items
  has_many :purchases

## Itemsテーブル:

| Column               | Type        | Options                      |
| ---------------------| --------    | ---------------------------  |
| user                 | references  | null: false,foreign_key: true|
| description          | text        | null: false                  | 
| price                | integer     | null: false                  | 
| item_name            | string      | null: false                  |
| item_category        | string      | null: false                  |
| item_status          | string      | null: false                  |
| shipping_fee_burden  | string      | null: false                  |
| shipping_area        | string      | null: false                  |
| ishipping_duration   | string      | null: false                  |

belongs_to :user
has_many :purchases

## Addressesテーブル:

| Column         | Type     | Options                   |
| -------------- | -------- | ------------------------- |
| address_all    | string   | null: false               |
| city           | string   | null: false               |
| street_address | string   | null: false               |
| building_name  | string   |                           |
| phone_number   | string   | null: false               |



## Purchasesテーブル 

| Column        | Type      | Options                                     |
| ------------- | --------- | ------------------------------------------- |
| item          | references| null: false,foreign_key: true               |
| user          | references| null: false,foreign_key: true               |

  belongs_to :user
  belongs_to :item
