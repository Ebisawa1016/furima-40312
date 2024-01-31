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
| id:                | integer  | null: false,unique: true|
| name:              | string   | null: false             |
| email:             | string   | null: false             |
| password:          | string   | null: false             |
| address:           | string   | null: false             |
| phone:             | string   | null: false             |
| paymentInfo:       | string   | null: false             |
| ProfileImage:      | string   | null: false             |
| created_at:        | datetime | null: false             |
| update_at:         | datetime | null: false             |

has_many :items

## Itemsテーブル:

| Column       | Type     | Options                     |
| ------------ | -------- | --------------------------- |
| id           | integer  | null: false,unique: true    |
| user_id      | integer  | null: false                 | 
| description  | string   | null: false                 | 
| price        | decimal  | null: false                 | 
| sold         | boolean  | null: false                 | 
| sold_at      | datetime | null: false                 |
| created_at   | datetime | null: false                 |
| updated_at   | datetime | null: false                 |

has_many :item_categories
has_many :categories, through: :item_categories

## Categoriesテーブル:

| Column       | Type     | Options                     |
| ------------ | -------- | --------------------------- |
| id           | integer  | null: false,unique: true    |
| name         | string   | null: false                 | 

has_many :item_categories
has_many :items, through: :item_categories


## ItemCategoriesテーブル 

| Column       | Type     | Options                     |
| ------------ | -------- | --------------------------- |
|item_id:      | integer  | null: false,unique: true    |
|category_id  | string   | null: false                 | 

belongs_to :item
belongs_to :category

