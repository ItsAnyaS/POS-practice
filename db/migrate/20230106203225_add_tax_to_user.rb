class AddTaxToUser < ActiveRecord::Migration[7.0]
  def change

    add_column :users, :tax_rate, :integer
    
  end
end
