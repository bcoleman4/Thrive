class TwoCriteriaToString < ActiveRecord::Migration[5.0]
  def change
  	change_column(:two_criteria, :C1loweroperator, :string)
  	change_column(:two_criteria, :C1upperoperator, :string)
  	change_column(:two_criteria, :C2loweroperator, :string)
  	change_column(:two_criteria, :C2upperoperator, :string)
  end
end
