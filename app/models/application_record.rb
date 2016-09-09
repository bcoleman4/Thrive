class ApplicationRecord < ActiveRecord::Base
  	self.abstract_class = true

  	def counta
  		@counta = 0
  		sleep(30)
  		@counta +1
	end
end
