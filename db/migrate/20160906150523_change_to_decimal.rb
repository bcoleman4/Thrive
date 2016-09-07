class ChangeToDecimal < ActiveRecord::Migration[5.0]
  def change
  	change_column(:two_results, :R1, :decimal)
  	change_column(:two_results, :R2, :decimal)
  	change_column(:two_criteria, :C1lowervalue, :decimal)
  	change_column(:two_criteria, :C1uppervalue, :decimal)
  	change_column(:two_criteria, :C2lowervalue, :decimal)
  	change_column(:two_criteria, :C2uppervalue, :decimal)
  end
end
