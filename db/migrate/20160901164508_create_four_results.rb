class CreateFourResults < ActiveRecord::Migration[5.0]
  def change
    create_table :four_results do |t|
      t.integer :R1
      t.integer :R2
      t.integer :R3
      t.integer :R4

      t.timestamps
    end
  end
end
