class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.decimal :amount
      t.string :currency
      t.integer :card_type
      t.string :card_number
      t.integer :card_expiry_month
      t.integer :card_expiration_year
      t.integer :user_id
      t.string :authorization_code
      t.datetime :subscription_time

      t.timestamps
    end
  end
end
