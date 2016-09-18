class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :counta
  helper_method :create_a_pdf

  	#require 'fastthread'
	require 'prawn'
	#require 'openwfe/util/scheduler'
	require 'rufus-scheduler'

	def input
		@rows = 5
	end
	def input2
		@rows = 5
	end

	def pdf
		#function :create_a_pdf
		img = "#{Prawn::DATADIR}/images/ferrari.png"
		Prawn::Document.generate("background.pdf",
 		:background => img,
		:margin => 100
		) do
			text "My report caption", :size => 18, :align => :right
		 	move_down font.height * 2
		 	text "Here is my text explaning this report. " * 20,
		 	:size => 12, :align => :left, :leading => 2
		 	move_down font.height
		 	text "I'm using a soft background. " * 40,
		 	:size => 12, :align => :left, :leading => 2
		end

		pdf = Prawn::Document.new
		pdf.text "Hello World"
		pdf.text "We are still on the initial page for this example. Now I'll ask " + "Prawn to gently start a new page. Please follow me to the next page."
		pdf.start_new_page
		pdf.text "See. We've left the previous page behind."
		pdf.start_new_page
		pdf.stroke_horizontal_rule
		pdf.pad(20) { pdf.text "Text padded both before and after." }
		pdf.stroke_horizontal_rule
		pdf.pad_top(20) { pdf.text "Text padded on the top." }
		pdf.stroke_horizontal_rule
		pdf.pad_bottom(20) { pdf.text "Text padded on the bottom." }
		pdf.stroke_horizontal_rule
		pdf.move_down 30
		pdf.text "Text written before the float block."
		pdf.float do
			pdf.move_down 30
			pdf.bounding_box([0, pdf.cursor], :width => 200) do
				pdf.text "Text written inside the float block."
				pdf.stroke_bounds
			end
		end
		pdf.text "Text written after the float block."
		pdf.start_new_page
		pdf.text "The image will go right below this line of text."
		pdf.image "#{Prawn::DATADIR}/images/ferrari.png"
		pdf.render_file "assignment.pdf"

		Prawn::Document.generate("hello.pdf") do
	  		text "Hello World!"
	  	end
	end


	def auto2
		t = Thread.new do
			@de = 0
		  render "pdf"
		  #b = Thread.new do
		  #	redirect_back(fallback_location: '/pdf')
		  #end

		  while (@de < 10) do
		    p "@de = #{@de} at this point"
		    #respond_to do |format|
  				#format.js {render inline: "location.reload();" }
			#end

		    sleep 5
		    @de = @de +1
		  end
		end

		t.join # wait for thread to exit (never, in this case)
	end

	def hello2
		scheduler = Scheduler.new
		scheduler.start

		# Simple usage
		scheduler.schedule_every('2s') { p 'every 2 seconds' } 
		scheduler.schedule_every('5m') { p 'every 5 minutes' }
		scheduler.schedule_every('1d') { p 'every day' }

		# More fine-grained control + schedule task once.
		scheduler.schedule_in('3d2m10s') do
		    p 'after 3 days 2 minutes and 10 seconds stopping the scheduler and exiting...'
		    scheduler.do_stop
		end

		# Cron-string scheduling. There is something for everyone here!
		scheduler.schedule('1-60 * * * *') do
		    p 'perform task'
		end

		scheduler.join
  	end

  	def auto3
  		@switch = TRUE
  		p @switch
  		#sleep(3)

  		#@countc = auto2.countb
  		#@switch = FALSE
  		#p @switch
  	end 

	def auto2a
		@counta = 0
		until @counta >= 10 do
			p "#{@counta}"
			sleep (1)
			@counta = @counta + 1
		end
		p "I got here"
	end

	def test
		delete_table :two_outputs
		create_table :two_outputs do |t|
      		t.decimal :O1
      		t.decimal :O2
      		t.timestamps
		end
		rake db:migrate
	end

	def test_database_progress
	  	@timerstart = Time.new
	  	@count = 0
	  	@total = 110*110
	  	aRes = 0.0
	  	bRes = 0.0
	  	until bRes >= 10.0 do
	    	until aRes >= 10.0 do
	      	@two_result = TwoResult.new({"R1"=>'%.1f' % [aRes], "R2"=>'%.1f' % [bRes]})
	      	@two_result.save
	      	logger.info "Written #{'%.1f' % [aRes]} and #{'%.1f' % [bRes]} to database"
	      	aRes = aRes +0.1
	    	@count +1
	    	end
		bRes = bRes +0.1
		aRes = 0.0		    	
    	end
	  	@timerend = Time.new
	  	@duration = (@timerend - @timerstart) 
	  	@mins = (@duration / 60)
	  	@secs = (@duration % 60)
	  	case 
	  		when @mins < 1
	  			logger.info "The total processing took #{'%.2f' % [@duration]} seconds"
	  		when @mins < 2
	  			logger.info "The total processing took #{'%.0f' % [@mins]} min and #{'%.2f' % [@secs]} seconds"
			when @mins >= 2
				logger.info "The total processing took #{'%.0f' % [@mins]} mins and #{'%.2f' % [@secs]} seconds"
		end
	  	logger.info "*************************************************************"
	  	logger.info "Finished function to the end"
	end

	def create_master_database
		@timerstart = Time.new
		logger.info "*************************************************************"
		logger.info "Starting function auto2 in application_controller"
		logger.info "start time of #{@timerstart}"
		#clear the database records
		logger.info "*************************************************************"
		logger.info "Deleting all records from TwoResult database"
		TwoResult.destroy_all
		logger.info "*************************************************************"
		logger.info "Starting loop procedure"
		#create all of the combinations and insert into database
		aRes = 0.0
	  	bRes = 0.0
	  	cRes = 0.0
	  	dRes = 0.0
	  	eRes = 0.0
	  	fRes = 0.0
	  	until fRes >= 10.0 do
		  	until eRes >= 10.0 do
			  	until dRes >= 10.0 do
				  	until cRes >= 10.0 do
					  	until bRes >= 10.0 do
					    	until aRes >= 10.0 do
					      	@two_result = TwoResult.new({"R1"=>'%.1f' % [aRes], "R2"=>'%.1f' % [bRes]})
					      	@two_result.save
					      	logger.info "Written #{'%.1f' % [aRes]} and #{'%.1f' % [bRes]} to database"
					      	aRes = aRes +0.1
					    	end
						bRes = bRes +0.1
	    				aRes = 0.0		    	
				    	end
			    	cres = cRes +0.1
			    	bRes = 0.0
	    			aRes = 0.0
			    	end
			    dres = dres +0.1
		    	cres = 0.0
		    	bRes = 0.0
    			aRes = 0.0
		    	end
		    	eres = eres +0.1
		    	dres = 0.0
		    	cres = 0.0
		    	bRes = 0.0
    			aRes = 0.0
	    	end
	 	   	fres = fres +0.1
	    	eres = 0.0
	    	dres = 0.0
	    	cres = 0.0
	    	bRes = 0.0
			aRes = 0.0
		end
    	#Counting the rows written to database
    	db = SQLite3::Database.open( "db/development.sqlite3" ) 
    	@tworesultcount = db.execute ( "select count(*) from two_results" )
    	logger.info "#{@tworesultcount} rows written to tworesults database"
	  	@timerend = Time.new
	  	@duration = (@timerend - @timerstart) 
	  	@mins = (@duration / 60)
	  	@secs = (@duration % 60)
	  	case 
	  		when @mins < 1
	  			logger.info "The total processing took #{'%.2f' % [@duration]} seconds"
	  		when @mins < 2
	  			logger.info "The total processing took #{'%.0f' % [@mins]} min and #{'%.2f' % [@secs]} seconds"
			when @mins >= 2
				logger.info "The total processing took #{'%.0f' % [@mins]} mins and #{'%.2f' % [@secs]} seconds"
		end
		logger.info "*************************************************************"
	  	logger.info "Finished function to the end"
	end

	def output2
		@timerstart = Time.new
		logger.info "start time of #{@timerstart}"
		logger.info "*************************************************************"
		logger.info " Starting function output2 in application_controller"
		logger.info "*************************************************************"
		logger.info "Deleting all records from TwoOutput database"
		@amet = FALSE
		@bmet = FALSE
		TwoOutput.destroy_all
		logger.info "*************************************************************"
		logger.info "Setting variables"
		@resultcount = 0
		@criteriacount = 0
		@arow = 0
		@rescol = 1
		@criflik = 4
		@lowvalcol = 1 #(@lowvalcol + ((@rescol - 1) * @criflik))
		@lowcricol = 2 #(@lowcricol + ((@rescol - 1) * @criflik))
		@hivalcol = 3 #(@hivalcol + ((@rescol - 1) * @criflik))
		@hicricol = 4 #(@hicricol + ((@rescol - 1) * @criflik))
		lessthan = :<
		greaterthan = :>
		lessthanequalto = :<=
		greaterthanequalto = :>=
		equalto = :==
		nothing = :''
		logger.info "*************************************************************"
		logger.info "Pulling data from database"
		db = SQLite3::Database.open( "db/development.sqlite3" ) 
		@tworesult = db.execute( "select * from two_results" )
		#@tworesult.flatten!
		@twocriteria = db.execute ( "select * from two_criteria" )
		@tworesultcounta = db.execute ( "select count(*) from two_results" )
		@tworesultcountb = @tworesultcounta.fetch(0)
		@tworesultcount = @tworesultcountb.fetch(0)
		@twocriteriacounta = db.execute ( "select count(*) from two_criteria" )
		@twocriteriacountb = @twocriteriacounta.flatten!
		@twocriteriacount = @twocriteriacountb[0]
		logger.info "*************************************************************"
		logger.info "Starting loop process"
		until @resultcount == @tworesultcount do
			logger.info "*************************************************************"
			logger.info "This is loop number #{@resultcount} of the until @resultcount statement" 
			until @criteriacount == (@twocriteriacount) do
				logger.info "*************************************************************"
				logger.info "This is loop number #{@criteriacount} of the until @criteriacount statement" 
				until @rescol == 3 do
					logger.info "*************************************************************"
					logger.info "This is loop number #{@rescol} of the until @rescol statement" 						
					logger.info "@resultcount is #{@resultcount}"
					logger.info "@tworesultcount is #{@tworesultcount}"
					logger.info "@twocriteriacount is #{@twocriteriacount}"
					logger.info "(@lowcricol + ((@rescol - 1) * @criflik)) is #{(@lowcricol + ((@rescol - 1) * @criflik))}"
					logger.info "(@hicricol + ((@rescol - 1) * @criflik)) is #{(@hicricol + ((@rescol - 1) * @criflik))}"
					logger.info "@twocriteria is #{@twocriteria}"
					logger.info "@criteriacount is #{@criteriacount}"
					logger.info "@rescol is #{@rescol}"
					logger.info "@tworesult[@resultcount][@rescol] is #{@tworesult[@resultcount][@rescol]}"	
					logger.info "@twocriteria[@criteriacount][(@lowvalcol + ((@rescol - 1) * @criflik))] is #{@twocriteria[@criteriacount][(@lowvalcol + ((@rescol - 1) * @criflik))]}"
					logger.info "@twocriteria[@criteriacount][(@hivalcol + ((@rescol - 1) * @criflik))] + ((@rescol - 1) * @criflik))] is #{@twocriteria[@criteriacount][(@hivalcol + ((@rescol - 1) * @criflik))]}"
					logger.info "@twocriteria[@criteriacount][@hicricol + ((@rescol - 1) * @criflik))] is #{@twocriteria[@criteriacount][(@hicricol + ((@rescol - 1) * @criflik))]}"
					logger.info "At first case check"
					@aif = @twocriteria[@criteriacount][(@lowcricol + ((@rescol - 1) * @criflik))]
					logger.info "@aif is #{@aif}"
					case @aif
						when ">" # ">"
							@lowcriteria = greaterthan
						when "<" # "<"
							@lowcriteria = lessthan
						when ">=" # "=>"
							@lowcriteria = greaterthanequalto
						when "<=" # "=<"
							@lowcriteria = lessthanequalto
						when "==" # "="
							@lowcriteria = equalto
						when "" # " "
							#TODO
					end
					logger.info "@lowcriteria is #{@lowcriteria}"
					logger.info "At second case check"
					@bif = @twocriteria[@criteriacount][(@hicricol + ((@rescol - 1) * @criflik))]
					logger.info "@bif is #{@bif}"
					case @bif
						when ">" # ">"
							@hicriteria = greaterthan
						when "<" # "<"
							@hicriteria = lessthan
						when ">=" # "=>"
							@hicriteria = greaterthanequalto
						when "<=" # "=<"
							@hicriteria = lessthanequalto
						when "==" # "="
							@hicriteria = equalto
						when "" # " "
							#TODO
					end
					logger.info "@hicriteria is #{@hicriteria}"
					logger.info "At condition check"
					logger.info "(@tworesult[@resultcount][@rescol].public_send(@lowcriteria, @twocriteria[@criteriacount][(@lowvalcol + ((@rescol - 1) * @criflik))]) is #{@tworesult[@resultcount][@rescol].public_send(@lowcriteria, @twocriteria[@criteriacount][(@lowvalcol + ((@rescol - 1) * @criflik))])}"
					logger.info "(@tworesult[@resultcount][@rescol].public_send(@hicriteria, @twocriteria[@criteriacount][(@hivalcol + ((@rescol - 1) * @criflik))]) is #{@tworesult[@resultcount][@rescol].public_send(@hicriteria, @twocriteria[@criteriacount][(@hivalcol + ((@rescol - 1) * @criflik))])}"  
					if @tworesult[@resultcount][@rescol].public_send(@lowcriteria, @twocriteria[@criteriacount][(@lowvalcol + ((@rescol - 1) * @criflik))])
						if @tworesult[@resultcount][@rescol].public_send(@hicriteria, @twocriteria[@criteriacount][(@hivalcol + ((@rescol - 1) * @criflik))])
							logger.info "got here 0"
							if @rescol == 1
								logger.info "got here 1"
								@ares = @tworesult[@resultcount][@rescol]
								@amet = TRUE
							elsif @rescol == 2
								logger.info "got here 2"
								@bres = @tworesult[@resultcount][@rescol]
								@bmet = TRUE
							end
						end
					end
					logger.info "@amet is #{@amet} and @bmet is #{@bmet}"
					logger.info "@ares is #{@ares} and @bres is #{@bres}"
					logger.info "Adding one to @rescol"
					@rescol = @rescol+1
				end
				logger.info "Checking whether to update Output database"
				if @ares != nil
					if @bres != nil
						if @amet == TRUE
							if @bmet == TRUE
								@two_output = TwoOutput.new({"O1"=>'%.2f' % [@ares], "O2"=>'%.2f' % [@bres]})
								@two_output.save
								@amet = FALSE
								@bmet = FALSE
								@ares = nil
								@bres = nil
								logger.info "A record has been added to TwoOutput database"
							end
						end
					end
				end
				logger.info "Adding one to @criteriacount"
				@criteriacount = @criteriacount + 1
				@rescol = 1
				@ares = nil
				@bres = nil
			end
		logger.info "Adding one to @resultcount"
		@resultcount = @resultcount+1
		@criteriacount = 0
		@rescol = 1
		@amet = FALSE
		@bmet = FALSE
		end
	  	@timerend = Time.new
	  	@duration = (@timerend - @timerstart) 
	  	@mins = (@duration / 60)
	  	@secs = (@duration % 60)
	  	case 
	  		when @mins < 1
	  			logger.info "The total processing took #{'%.2f' % [@duration]} seconds"
	  		when @mins < 2
	  			logger.info "The total processing took #{'%.0f' % [@mins]} min and #{'%.2f' % [@secs]} seconds"
			when @mins >= 2
				logger.info "The total processing took #{'%.0f' % [@mins]} mins and #{'%.2f' % [@secs]} seconds"
		end
	  	logger.info "*************************************************************"
	  	logger.info "Finished function to the end"
	end
end
