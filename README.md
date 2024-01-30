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

id: ユーザーID 
name: ユーザー名
email: メールアドレス
password: パスワード
Address:住所
Phone Number:電話番号
Payment Info:支払い情報
Profile Image:プロフ画像
created_at: アカウント作成日
updated_at: アカウント更新日

## Itemsテーブル:


id: アイテムID 
user_id: 出品者のユーザーID 
description: アイテムの説明
price: 価格
sold:商品の状況
sold_at:売れた日時
created_at: 商品投稿日
updated_at: 商品情報更新日

## Categoriesテーブル:

id: カテゴリーID 
name: カテゴリー名

## ItemCategoriesテーブル 


item_id: アイテムID 
category_id: カテゴリーID 

