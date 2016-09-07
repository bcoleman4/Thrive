class CreateFiveResults < ActiveRecord::Migration[5.0]
  def change
    create_table :five_results do |t|
      t.integer :R1
      t.integer :R2
      t.integer :R3
      t.integer :R4
      t.integer :R5

      t.timestamps
    end
  end
end
