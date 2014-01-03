class CreateCarsTable < ActiveRecord::Migration
  def change
    create_table :cars_tables do |t|
      t.string :color, null: false
      t.integer :mileage, null: false
      t.integer :year, null: false
      t.text :description

      t.timestamps
    end
  end
end
