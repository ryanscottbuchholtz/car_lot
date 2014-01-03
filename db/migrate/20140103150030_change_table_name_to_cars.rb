class ChangeTableNameToCars < ActiveRecord::Migration
  def up
    rename_table :cars_tables, :cars
  end

  def down
    rename_table :cars, :cars_tables
  end

end
