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

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nick_name | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| last_name|string | null: false |
| first_name   | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana |string | null: false |
| birthday |date| null: false |

 ### Association

 - has_many :items
 - has_many :purchases


## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| user   | string | null: false |
| price  | string | null: false |
| images  | string | null: false |
| text  | string | null: false |
| category | string | null: false |
| item_status| string | null: false|
|delivery free  | string | null: false |
| shipping_region | string | null: false |
| days_until_shipping| string | null: false|





### Association

- belongs_to :users　
- has_one    :purchases　

## purchases テーブル

| Column | Type       | Options                        |　
| ------ | ---------- | ------------------------------ |　
| user   | references | null: false, foreign_key: true |　
| item   | references | null: false, foreign_key: true |　
| price  | string     | null: false, foreign_key: true |　

### Association　

- has_many :users　
- belongs_to :item　
- belongs_to  :shipping_address　
## shipping_address テーブル　

| Column  | Type       | Options                        |　
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |　
| item    | references | null: false, foreign_key: true |　
|  | references |  |

### Association　

belongs_to :purchase
belongs_to :user 　

