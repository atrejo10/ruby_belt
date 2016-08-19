class SetDefaultValue < ActiveRecord::Migration
  def change
    change_column_default :borrowers, :raised, 0
  end
end
