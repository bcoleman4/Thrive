class CreateThreeResults < ActiveRecord::Migration[5.0]
  def change
    create_table :three_results do |t|
      t.integer :R1
      t.integer :R2
      t.integer :R3

      t.timestamps
    end
  end
end
