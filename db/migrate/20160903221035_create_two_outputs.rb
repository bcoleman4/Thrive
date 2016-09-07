class CreateTwoOutputs < ActiveRecord::Migration[5.0]
  def change
    create_table :two_outputs do |t|
      t.integer :O1
      t.integer :O2

      t.timestamps
    end
  end
end
