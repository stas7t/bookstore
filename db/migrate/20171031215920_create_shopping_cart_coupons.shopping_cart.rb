# This migration comes from shopping_cart (originally 20171028170149)
class CreateShoppingCartCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_coupons do |t|
      t.string :code
      t.decimal :discount
      t.boolean :active

      t.timestamps
    end
  end
end
