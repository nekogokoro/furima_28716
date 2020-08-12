class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :image
      t.string :title
      t.text :text
      t.integer :price
      t.references :user
      t.integer :category
      t.integer :status
      t.integer :shipping_charges
      t.integer :shipping_region
      t.integer :day_until_shipping
      t.timestamps
    end
  end
end
