class ChangeToTwoCriteria < ActiveRecord::Migration[5.0]
  def change
  	change_column(:two_criteria, :C1lowervalue, :integer)
  	change_column(:two_criteria, :C1uppervalue, :integer)
  	change_column(:two_criteria, :C2lowervalue, :integer)
  	change_column(:two_criteria, :C2lowervalue, :integer)
  end
end
