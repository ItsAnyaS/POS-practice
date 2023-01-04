class CreatePeriods < ActiveRecord::Migration[7.0]
  def change
    create_table :periods do |t|
      t.integer :number_of_transactions
      t.integer :amount_made
      t.integer :total_tips
      t.integer :total_tax
      t.integer :total_number_of_items
      t.integer :user_id

      t.timestamps
    end
  end
end
