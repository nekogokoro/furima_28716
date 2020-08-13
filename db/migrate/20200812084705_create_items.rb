class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :image                 .null: false
      t.string :title                 .null: false
      t.text :text                    .null: false
      t.integer :price                .null: false
      t.references :user              .null: false
      t.integer :category_id          .null: false
      t.integer :status_id            .null: false
      t.integer :shipping_charges_id  .null: false
      t.integer :shipping_region_id   .null: false
      t.integer :day_until_shipping_id.null: false
      t.timestamps
    end
  end
end
