class ChangeDateFormatInMyTable < ActiveRecord::Migration[5.0]
  def change
  	change_column(:two_results, :R1, :float)
  	change_column(:two_results, :R2, :float)
  end
end
