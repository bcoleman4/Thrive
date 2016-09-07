class CreateTwoResults < ActiveRecord::Migration[5.0]
  def change
    create_table :two_results do |t|
      t.integer :R1
      t.integer :R2

      t.timestamps
    end
  end
end
