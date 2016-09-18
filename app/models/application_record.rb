class ApplicationRecord < ActiveRecord::Base
  	self.abstract_class = true
#  	require 'prawn'
  	#require 'openwferu'
#
#scheduler = Scheduler.new
#scheduler.start

# Simple usage
#scheduler.schedule_every('2s') { p 'every 2 seconds' } 
#scheduler.schedule_every('5m') { p 'every 5 minutes' }
#scheduler.schedule_every('1d') { p 'every day' }

# More fine-grained control + schedule task once.
#scheduler.schedule_in('3d2m10s') do
 #   p 'after 3 days 2 minutes and 10 seconds stopping the scheduler and exiting...'
  #  scheduler.do_stop
#end

# Cron-string scheduling. There is something for everyone here!
#scheduler.schedule('1-60 * * * *') do
 #   p 'perform task'
#end

#scheduler.join

end
