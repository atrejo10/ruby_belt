class AddColumnMoneyToBorrower < ActiveRecord::Migration
  def change
    add_column :borrowers, :money, :integer
  end
end
