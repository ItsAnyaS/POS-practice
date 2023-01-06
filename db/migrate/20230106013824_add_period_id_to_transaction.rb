class AddPeriodIdToTransaction < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :period_id, :integer
  end
end
