# This migration comes from shopping_cart (originally 20171028171330)
class CreateShoppingCartAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :country
      t.string :zip
      t.string :phone
      t.string :address_type

      t.integer :user_id, foreign_key: true
      t.references :order, foreign_key: { to_table: :shopping_cart_orders }

      t.timestamps
    end
  end
end
