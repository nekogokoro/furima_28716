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
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| shipping_address|string | null: false |

### Association

- has_many :items
- has_many :purchases
- has_many :messages
- has_one  :shipping_address


## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| user   | string | null: false |
| price  | string | null: false |

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
- belongs_to :items
- has_one  :shipping_address
## shipping_address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

### Association

belongs_to :purchases
belomgs_to :users

