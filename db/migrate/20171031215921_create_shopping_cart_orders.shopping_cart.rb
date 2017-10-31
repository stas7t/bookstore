# This migration comes from shopping_cart (originally 20171028171039)
class CreateShoppingCartOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_orders do |t|
      t.string :number
      t.integer :status

      t.integer :user_id, foreign_key: true
      t.references :coupon, foreign_key: { to_table: :shopping_cart_coupons }
      t.references :delivery, foreign_key: { to_table: :shopping_cart_deliveries }
      t.references :credit_card, foreign_key: { to_table: :shopping_cart_credit_cards }

      t.timestamps
    end
  end
end
