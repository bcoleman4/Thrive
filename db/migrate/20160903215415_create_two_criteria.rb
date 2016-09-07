class CreateTwoCriteria < ActiveRecord::Migration[5.0]
  def change
    create_table :two_criteria do |t|
      t.float :C1lowervalue
      t.string :C1loweroperator
      t.float :C1uppervalue
      t.string :C1upperoperator
      t.float :C2lowervalue
      t.string :C2loweroperator
      t.float :C2uppervalue
      t.string :C2upperoperator

      t.timestamps
    end
  end
end
