class auto2 < ApplicationRecord
	SCHEDULER.every '1s' do
	until @switch = FALSE	
		countb = 0
		until countb >= 10 do
			p "#{countb}"
			p "I got here"
			sleep (13)
			countb = countb + 1
		end
		p "I got here"
	end
end