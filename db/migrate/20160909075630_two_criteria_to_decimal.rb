class TwoCriteriaToDecimal < ActiveRecord::Migration[5.0]
  def change
  	change_column(:two_criteria, :C1lowervalue, :decimal)
  	change_column(:two_criteria, :C1uppervalue, :decimal)
  	change_column(:two_criteria, :C2lowervalue, :decimal)
  	change_column(:two_criteria, :C2uppervalue, :decimal)
  end
end
