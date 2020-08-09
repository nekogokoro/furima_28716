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

| Column         | Type   | Options     |
| --------       | ------ | ----------- |
| nick_name      | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| last_name      | string | null: false |
| first_name     | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana| string | null: false |
| birthday       | date   | null: false |

 ### Association

 - has_many :items
 - has_many :purchases
 


## items テーブル

| Column              | Type       | Options                        |
| ------              | ------     | -----------                    |
| images              | image      | null: false                    |
| title               | string     | null: false                    |
| text                | text       | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |
| category(active_hash)            |  integer| null: false          |
| status (active_hash)             | integer | null: false          |
| shipping_charges (active_hash)   | integer   null: false          |
| shipping_region (active_hash)    | integer | null: false          |
| day_until_shipping(active_hash)  | integer | null: false          |　



### Association

- belongs_to :user　
- has_one    :shipping_addresses
- has_one    :purchase

## purchases テーブル

| Column | Type       | Options                        |　
| ------ | ---------- | ------------------------------ |　
| user_id| references | null: false, foreign_key: true |
| item_id| references | null: false, foreign_key: true |　　

### Association　

- belongs_to :item　
- belongs_to :user　


### shipping_addresses テーブル　

| Column             | Type        | Options                       |　
| -------            | ----------  | ----------------------------- | 
|  item              |  references | null: false, foreign_key: true|
|  postal_code       |   string    | null: false,                  |
|  prefecture(active_hash)         | integer| null: false,         |
|  city              |   string    | null: false,                  |
|  house_number      |   string    | null: false,                  |
|  building_name     |   string    |                               |
|  tel               |   string    | null.  false,                 |
### Association　

belongs_to :item











