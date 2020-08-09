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
 - has_one    :card


## items テーブル

| Column  | Type       | Options     |
| ------  | ------     | ----------- |
| images  | string     | null: false |
| title   | text       | null: false |
| text    | text       | null: false |
| price   | integer    | null: false |
| user_id | references | null: false, foreign_key: true |　　



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

### shipping_addresses テーブル　

| Column             | Type        | Options                       |　
| -------            | ----------  | ----------------------------- | 
|  user_id           |  references | null: false, foreign_key: true|
|  purchases_id      |  references | null: false, foreign_key: true|
### Association　

belongs_to :purchase
belongs_to :user
has_one    :card

### Cards
| Column             | Type        | Options                       |　
| -------            | ----------  | ----------------------------- | 
|  user_id           |  references | null: false, foreign_key: true|
| PAYJP_PUBLIC_KEY   |  references | null: false, foreign_key: true|
| PAYJP_SECRET_KEY   |  references | null: false, foreign_key: true|

### Association

- belongs_to  :users





=================================================================

### ActiveHash
class Category < ActiveHash::Base
 self.data = [
   { id: 1, name: '--' },
   { id: 2, name: 'レディース },
   { id: 3, name: 'メンズ' },
   { id: 4, name: 'ベビー.キッズ' },
   { id: 5, name: 'インテリア.住まい.小物' },
   { id: 6, name: '本.音楽.ゲーム' },
   { id: 7, name: 'おもちゃ.ホビー.グッズ' },
   { id: 8, name: '家電.スマホ.カメラ' },
   { id: 9, name: 'スポーツ.レジャー' },
   { id:10, name: 'ハンドメイド' }
   { id:11, name: 'その他' }
 ]
 end

 class Status < ActiveHash::Base
 self.data = [
   { id: 1, name: '--' },
   { id: 2, name: '新品.未使用' },
   { id: 3, name: '未使用に近い' },
   { id: 4, name: '目立った傷や汚れなし' },
   { id: 5, name: 'やや傷や汚れあり' },
   { id: 6, name: '傷や汚れあり' },
   { id: 7, name: '全体的に状態が悪い' },
   
 ]
 end

 class Shipping_charges< ActiveHash::Base
 self.data = [
   { id: 1, name: '--' },
   { id: 2, name: '着払い（購入者負担）' },
   { id: 3, name: '送料込み（出品者負担）' },
 ]
 end

 class Shipping_region < ActiveHash::Base
  self.data = [
      {id: 1, name: '北海道'}, {id: 2, name: '青森県'}, {id: 3, name: '岩手県'},
      {id: 4, name: '宮城県'}, {id: 5, name: '秋田県'}, {id: 6, name: '山形県'},
      {id: 7, name: '福島県'}, {id: 8, name: '茨城県'}, {id: 9, name: '栃木県'},
      {id: 10, name: '群馬県'}, {id: 11, name: '埼玉県'}, {id: 12, name: '千葉県'},
      {id: 13, name: '東京都'}, {id: 14, name: '神奈川県'}, {id: 15, name: '新潟県'},
      {id: 16, name: '富山県'}, {id: 17, name: '石川県'}, {id: 18, name: '福井県'},
      {id: 19, name: '山梨県'}, {id: 20, name: '長野県'}, {id: 21, name: '岐阜県'},
      {id: 22, name: '静岡県'}, {id: 23, name: '愛知県'}, {id: 24, name: '三重県'},
      {id: 25, name: '滋賀県'}, {id: 26, name: '京都府'}, {id: 27, name: '大阪府'},
      {id: 28, name: '兵庫県'}, {id: 29, name: '奈良県'}, {id: 30, name: '和歌山県'},
      {id: 31, name: '鳥取県'}, {id: 32, name: '島根県'}, {id: 33, name: '岡山県'},
      {id: 34, name: '広島県'}, {id: 35, name: '山口県'}, {id: 36, name: '徳島県'},
      {id: 37, name: '香川県'}, {id: 38, name: '愛媛県'}, {id: 39, name: '高知県'},
      {id: 40, name: '福岡県'}, {id: 41, name: '佐賀県'}, {id: 42, name: '長崎県'},
      {id: 43, name: '熊本県'}, {id: 44, name: '大分県'}, {id: 45, name: '宮崎県'},
      {id: 46, name: '鹿児島県'}, {id: 47, name: '沖縄県'}
  ]
 
 end

 class Day_until_shipping < ActiveHash::Base
 self.data = [
   { id: 1, name: '--' },
   { id: 2, name: '１日〜２日で発送' },
   { id: 3, name: '２日〜３日で発送' },
   { id: 4, name: '４日〜７日で発送' },
  
 ]
 end

 class purchases_id  < ActiveHash::Base
  self.data = [
      {id: 1, name: '北海道'}, {id: 2, name: '青森県'}, {id: 3, name: '岩手県'},
      {id: 4, name: '宮城県'}, {id: 5, name: '秋田県'}, {id: 6, name: '山形県'},
      {id: 7, name: '福島県'}, {id: 8, name: '茨城県'}, {id: 9, name: '栃木県'},
      {id: 10, name: '群馬県'}, {id: 11, name: '埼玉県'}, {id: 12, name: '千葉県'},
      {id: 13, name: '東京都'}, {id: 14, name: '神奈川県'}, {id: 15, name: '新潟県'},
      {id: 16, name: '富山県'}, {id: 17, name: '石川県'}, {id: 18, name: '福井県'},
      {id: 19, name: '山梨県'}, {id: 20, name: '長野県'}, {id: 21, name: '岐阜県'},
      {id: 22, name: '静岡県'}, {id: 23, name: '愛知県'}, {id: 24, name: '三重県'},
      {id: 25, name: '滋賀県'}, {id: 26, name: '京都府'}, {id: 27, name: '大阪府'},
      {id: 28, name: '兵庫県'}, {id: 29, name: '奈良県'}, {id: 30, name: '和歌山県'},
      {id: 31, name: '鳥取県'}, {id: 32, name: '島根県'}, {id: 33, name: '岡山県'},
      {id: 34, name: '広島県'}, {id: 35, name: '山口県'}, {id: 36, name: '徳島県'},
      {id: 37, name: '香川県'}, {id: 38, name: '愛媛県'}, {id: 39, name: '高知県'},
      {id: 40, name: '福岡県'}, {id: 41, name: '佐賀県'}, {id: 42, name: '長崎県'},
      {id: 43, name: '熊本県'}, {id: 44, name: '大分県'}, {id: 45, name: '宮崎県'},
      {id: 46, name: '鹿児島県'}, {id: 47, name: '沖縄県'}
  ]
 end
===========================================================
 db/migrate/20XXXXXXXXXXXX_create_〜への記載

 t.integer    :Category_id            , null: false
 t.integer    :Status_id              , null: false
 t.integer    :Shipping_charges_id    , null: false
 t.integer    :Shipping_region_id     , null: false
 t.integer    :Day_until_shipping_id  , null: false
 t.integer    :purchases_id           , null: false


===============================================================






 

