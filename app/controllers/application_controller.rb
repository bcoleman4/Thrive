class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	def test
	  @timerstart = Time.new
	  sleep(4)
	  @timerend = Time.new
	  p "The total processing took #{'%.2f' % [@timerend - @timerstart]} seconds"
	end

	def auto2 
		@timerstart = Time.new
		p "*************************************************************"
		p "Starting function auto2 in application_controller"
		#clear the database records
		p "*************************************************************"
		p "Deleting all records from TwoResult database"
		TwoResult.destroy_all
		p "*************************************************************"
		p "Starting loop procedure"
		#create all of the combinations and insert into database
		aRes = 0.0
	  	bRes = 0.0
	  	until bRes >= 10.0 do
	    	until aRes >= 10.0 do
	      	@two_result = TwoResult.new({"R1"=>'%.1f' % [aRes], "R2"=>'%.1f' % [bRes]})
	      	@two_result.save
	      	p "Written #{'%.1f' % [aRes]} and #{'%.1f' % [bRes]} to database"
	      	aRes = aRes +0.1
	    	end
	    bRes = bRes +0.1
	    aRes = 0.0
    	end
    	db = SQLite3::Database.open( "db/development.sqlite3" ) 
    	@tworesultcount = db.execute ( "select count(*) from two_results" )
    	p "#{@tworesultcount} rows written to tworesults database"
    	@timerend = Timer.new
    	p "The total processing took #{'%.2f' % [@timerend - @timerstart]} seconds"
	  	p "*************************************************************"
	  	p "Finished function to the end"
	end

	def output2
		@timerstart = Time.new
		p "*************************************************************"
		p " Starting function output2 in application_controller"
		p "*************************************************************"
		p "Deleting all records from TwoOutput database"
		@amet = FALSE
		@bmet = FALSE
		TwoOutput.destroy_all
		p "*************************************************************"
		p "Setting variables"
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
		p "*************************************************************"
		p "Pulling data from database"
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
		p "*************************************************************"
		p "Starting loop process"
		until @resultcount == @tworesultcount do
			p "*************************************************************"
			p "This is loop number #{@resultcount} of the until @resultcount statement" 
			until @criteriacount == (@twocriteriacount) do
				p "*************************************************************"
				p "This is loop number #{@criteriacount} of the until @criteriacount statement" 
				until @rescol == 3 do
					p "*************************************************************"
					p "This is loop number #{@rescol} of the until @rescol statement" 						
					p "@resultcount is #{@resultcount}"
					p "@tworesultcount is #{@tworesultcount}"
					p "@twocriteriacount is #{@twocriteriacount}"
					p "(@lowcricol + ((@rescol - 1) * @criflik)) is #{(@lowcricol + ((@rescol - 1) * @criflik))}"
					p "(@hicricol + ((@rescol - 1) * @criflik)) is #{(@hicricol + ((@rescol - 1) * @criflik))}"
					p "@twocriteria is #{@twocriteria}"
					p "@criteriacount is #{@criteriacount}"
					p "@rescol is #{@rescol}"
					p "@tworesult[@resultcount][@rescol] is #{@tworesult[@resultcount][@rescol]}"	
					p "@twocriteria[@criteriacount][(@lowvalcol + ((@rescol - 1) * @criflik))] is #{@twocriteria[@criteriacount][(@lowvalcol + ((@rescol - 1) * @criflik))]}"
					p "@twocriteria[@criteriacount][(@hivalcol + ((@rescol - 1) * @criflik))] + ((@rescol - 1) * @criflik))] is #{@twocriteria[@criteriacount][(@hivalcol + ((@rescol - 1) * @criflik))]}"
					p "@twocriteria[@criteriacount][@hicricol + ((@rescol - 1) * @criflik))] is #{@twocriteria[@criteriacount][(@hicricol + ((@rescol - 1) * @criflik))]}"
					p "At first case check"
					@aif = @twocriteria[@criteriacount][(@lowcricol + ((@rescol - 1) * @criflik))]
					p "@aif is #{@aif}"
					case @aif
						when "1" # ">"
							@lowcriteria = greaterthan
						when "2" # "<"
							@lowcriteria = lessthan
						when "3" # "=>"
							@lowcriteria = greaterthanequalto
						when "4" # "=<"
							@lowcriteria = lessthanequalto
						when "5" # "="
							@lowcriteria = equalto
						when '' # " "
							#TODO
					end
					p "@lowcriteria is #{@lowcriteria}"
					p "At second case check"
					@bif = @twocriteria[@criteriacount][(@hicricol + ((@rescol - 1) * @criflik))]
					p "@bif is #{@bif}"
					case @bif
						when "1" # ">"
							@hicriteria = greaterthan
						when "2" # "<"
							@hicriteria = lessthan
						when "3" # "=>"
							@hicriteria = greaterthanequalto
						when "4" # "=<"
							@hicriteria = lessthanequalto
						when "5" # "="
							@hicriteria = equalto
						when "6" # " "
							#TODO
					end
					p "@hicriteria is #{@hicriteria}"
					p "At condition check"
					p "(@tworesult[@resultcount][@rescol].public_send(@lowcriteria, @twocriteria[@criteriacount][(@lowvalcol + ((@rescol - 1) * @criflik))]) is #{@tworesult[@resultcount][@rescol].public_send(@lowcriteria, @twocriteria[@criteriacount][(@lowvalcol + ((@rescol - 1) * @criflik))])}"
					p "(@tworesult[@resultcount][@rescol].public_send(@hicriteria, @twocriteria[@criteriacount][(@hivalcol + ((@rescol - 1) * @criflik))]) is #{@tworesult[@resultcount][@rescol].public_send(@hicriteria, @twocriteria[@criteriacount][(@hivalcol + ((@rescol - 1) * @criflik))])}"  
					if @tworesult[@resultcount][@rescol].public_send(@lowcriteria, @twocriteria[@criteriacount][(@lowvalcol + ((@rescol - 1) * @criflik))])
						if @tworesult[@resultcount][@rescol].public_send(@hicriteria, @twocriteria[@criteriacount][(@hivalcol + ((@rescol - 1) * @criflik))])
							p "got here 0"
							if @rescol == 1
								p "got here 1"
								@ares = @tworesult[@resultcount][@rescol]
								@amet = TRUE
							elsif @rescol == 2
								p "got here 2"
								@bres = @tworesult[@resultcount][@rescol]
								@bmet = TRUE
							end
						end
					end
					p "@amet is #{@amet}"
					p "@bmet is #{@bmet}"
					p "@ares is #{@ares}"
					p "@bres is #{@bres}"
					p "Adding one to @rescol"
					@rescol = @rescol+1
				end
				p "Updating Output database"
				if @amet = TRUE
					if @bmet = TRUE
						@two_output = TwoOutput.new({"O1"=>@ares, "O2"=>@bres})
						@two_output.save
						@amet = FALSE
						@bmet = FALSE
						@ares = nil
						@bres = nil
						p "A record has been added to TwoOutput database"
					end
				end
				p "Adding one to @criteriacount"
				@criteriacount = @criteriacount + 1
				@rescol = 1
			end
		p "Adding one to @resultcount"
		@resultcount = @resultcount+1
		@criteriacount = 0
		@rescol = 1
		@amet = FALSE
		@bmet = FALSE
		end
		@timerend = Timer.new
    	p "The total processing took #{'%.2f' % [@timerend - @timerstart]} seconds"
	  	p "*************************************************************"
	  	p "Finished function to the end"
	end