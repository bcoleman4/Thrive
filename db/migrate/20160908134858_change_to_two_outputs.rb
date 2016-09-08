class ChangeToTwoOutputs < ActiveRecord::Migration[5.0]
  def change
  	change_column(:two_outputs, :O1, :decimal)
  	change_column(:two_outputs, :O2, :decimal)
  end
end
