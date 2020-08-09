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
| images              | image/jpg  | null: false                    |
| title               | text       | null: false                    |
| text                | text       | null: false                    |
| price               | integer    | null: false                    |
| user_id             | references | null: false, foreign_key: true |
| category(active_hash)            | category_id                  | null: false                    |
| status (active_hash)             | status_id                    | null: false                    |
| shipping_charges (active_hash)   | shipping_charges_id          | null: false                    |
| shipping_region (active_hash)    | shipping_region_id           | null: false                    |
| day_until_shipping(active_hash)  | day_until_shipping_id        | null: false                    |　



### Association

- belongs_to :user　
- has_one    :purchase　

## purchases テーブル

| Column | Type       | Options                        |　
| ------ | ---------- | ------------------------------ |　
| user_id| references | null: false, foreign_key: true |
| item_id| references | null: false, foreign_key: true |　　

### Association　

- belongs_to :item　
- has_one    :shipping_address
- belongs_to :user　


### shipping_addresses テーブル　

| Column             | Type        | Options                       |　
| -------            | ----------  | ----------------------------- | 
|  user_id           |  references | null: false, foreign_key: true|
|  purchases_id      |  references | null: false, foreign_key: true|
|  postal_code       |   integer   | null: false,                  |
|  prefecture(active_hash)         | purchases_id                  | null: false,             |
|  city              |   text      | null: false,                  |
|  house_number      |   text      | null: false,                  |
|  building_name     |   text      |                               |
|  tel               |   integer   | null.  false,                 |
### Association　

belongs_to :purchase









