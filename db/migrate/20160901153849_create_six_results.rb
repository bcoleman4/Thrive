class CreateSixResults < ActiveRecord::Migration[5.0]
  def change
    create_table :six_results do |t|
      t.integer :R1
      t.integer :R2
      t.integer :R3
      t.integer :R4
      t.integer :R5
      t.integer :R6

      t.timestamps
    end
  end
end
