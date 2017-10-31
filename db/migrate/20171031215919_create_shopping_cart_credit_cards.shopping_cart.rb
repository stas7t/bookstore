# This migration comes from shopping_cart (originally 20171028165821)
class CreateShoppingCartCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_credit_cards do |t|
      t.string :number
      t.string :name_on_card
      t.string :month_year
      t.string :cvv

      t.timestamps
    end
  end
end
