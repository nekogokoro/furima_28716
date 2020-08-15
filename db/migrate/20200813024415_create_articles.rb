class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
     t.string     :title        , null: false
     t.text       :text         , null: false
     t.integer    :category_id  , null: false
     t.integer    :shipping_charge_id ,null: false
     t.integer    :status_id    , null: false
     t.integer    :shipping_region_id, null: false
     t.integer    :day_until_shipping_id, null: false
     t.integer    :price        , null: false
     t.integer    :user_id      , null:false, foreign_key: true 
     t.timestamps
    end
  end
end
