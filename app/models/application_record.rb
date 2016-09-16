class ApplicationRecord < ActiveRecord::Base
  	self.abstract_class = true
  	require 'prawn'



	def create_a_pdf
		Prawn::Document.generate("hello.pdf") do
	  		text "Hello World!"
		end
	end

end
