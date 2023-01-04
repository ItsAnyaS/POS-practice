class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :number_of_items
      t.string :items, array: true, default: []
      t.integer :total
      t.integer :tax
      t.integer :tip

      t.timestamps
    end
  end
end
