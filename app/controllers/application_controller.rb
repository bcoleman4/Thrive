class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	def atest
	  @two_results = TwoResult.all

	end

	def auto2   
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
	      	@two_result = TwoResult.new({"R1"=>aRes, "R2"=>bRes})
	      	@two_result.save
	      	p "Written #{aRes} and #{bRes} to database"
	      	aRes = aRes +0.1
	    	end
	    bRes = bRes +0.1
	    aRes = 0.0
    	end
	  	p "*************************************************************"
	  	p "Finished function to the end"
	end

	def output2
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
	end

	def output2b
	#I think this code is going to have to live in the application controller
	#@two_outputs = TwoOutput.all
	#@two_results = TwoResult.all
	#@two_result = TwoResult.new

		@R1met = FALSE
		@R2met = FALSE
		TwoOutput.destroy_all
		
		db = SQLite3::Database.open( "db/development.sqlite3" ) 
    	@two_results_R1 = db.execute( "select R1 from two_results" )
    	@two_results_R2 = db.execute( "select R2 from two_results" )
		@two_criteria_C1loweroperator = db.execute( "select C1loweroperator from two_criteria" )
		@two_criteria_C1upperoperator = db.execute( "select C1upperoperator from two_criteria" )
		@two_criteria_C1lowervalue = db.execute( "select C1lowervalue from two_criteria" )
		@two_criteria_C1uppervalue = db.execute( "select C1uppervalue from two_criteria" )
		@two_criteria_C2loweroperator = db.execute( "select C2loweroperator from two_criteria" )
		@two_criteria_C2upperoperator = db.execute( "select C2upperoperator from two_criteria" )
		@two_criteria_C2lowervalue = db.execute( "select C2lowervalue from two_criteria" )
		@two_criteria_C2uppervalue = db.execute( "select C2uppervalue from two_criteria" )

		@two_criteria_C1loweroperator.flatten!
		@two_criteria_C1upperoperator.flatten!
		@two_criteria_C2loweroperator.flatten!
		@two_criteria_C2upperoperator.flatten!
		@two_results_R1.each do |a| 
			#puts @two_results_R1
			#puts @two_results_R2
			#puts @two_criteria_C1loweroperator
			@two_criteria_C1loweroperator.each do |b| 
				print @two_criteria_C1loweroperator[0]
				#print ("I'm the upper operator for criteria 1 " << @two_criteria_C1upperoperator)
				#print ("I'm the lower operator for criteria 2 " << @two_criteria_C2loweroperator)
				#print ("I'm the upper operator for criteria 2 " << @two_criteria_C2upperoperator)
				#print "I've worked"
				case @two_criteria_C1loweroperator[0]
				when '>'
					case @two_criteria_C1upperoperator[0]
					when '>'
						if ((@two_results_R1[0] > @two_criteria_C1lowervalue) && (@two_results_R1 > @two_criteria_C1uppervalue))
							@R1met = TRUE
						end
					when '<'
						if ((@two_results_R1[0] > @two_criteria_C1lowervalue) && (@two_results_R1 < @two_criteria_C1uppervalue))
							@R1met = TRUE
						end	
					when '=>'
						if ((@two_results_R1[0] > @two_criteria_C1lowervalue) && (@two_results_R1 >= @two_criteria_C1uppervalue))
							@R1met = TRUE
						end
					when '=<'
						if ((@two_results_R1 > @two_criteria_C1lowervalue) && (@two_results_R1 <= @two_criteria_C1uppervalue))
							@R1met = TRUE
						end
					when '='
						if ((@two_results_R1 > @two_criteria_C1lowervalue) && (@two_results_R1 == @two_criteria_C1uppervalue))
							@R1met = TRUE
						end
					when ''
						if (@two_results_R1 > @two_criteria_C1lowervalue)
							@R1met = TRUE
						end
					end
				when '<'
					case @two_criteria_C1upperoperator[0]
					when '>'
						if ((@two_results_R1 < @two_criteria_C1lowervalue) && (@two_results_R1 > @two_criteria_C1uppervalue))
							@R1met = TRUE
						end
					when '<'
						if ((@two_results_R1 < @two_criteria_C1lowervalue) && (@two_results_R1 < @two_criteria_C1uppervalue))
							@R1met = TRUE
						end	
					when '=>'
						if ((@two_results_R1 < @two_criteria_C1lowervalue) && (@two_results_R1 >= @two_criteria_C1uppervalue))
							@R1met = TRUE
						end
					when '=<'
						if ((@two_results_R1 < @two_criteria_C1lowervalue) && (@two_results_R1 <= @two_criteria_C1uppervalue))
							@R1met = TRUE
						end
					when '='
						if ((@two_results_R1 < @two_criteria_C1lowervalue) && (@two_results_R1 == @two_criteria_C1uppervalue))
							@R1met = TRUE
						end
					when ''
						if (@two_results_R1 < @two_criteria_C1lowervalue)
							@R1met = TRUE
						end
					end
				when '=>'
					case @two_criteria_C1upperoperator[0]
					when '>'
						if ((@two_results_R1 >= @two_criteria_C1lowervalue) && (@two_results_R1 > @two_criteria_C1uppervalue))
							@R1met = TRUE
						end
					when '<'
						if ((@two_results_R1 >= @two_criteria_C1lowervalue) && (@two_results_R1 < @two_criteria_C1uppervalue))
							@R1met = TRUE
						end
					when '=>'
						if ((@two_results_R1 >= @two_criteria_C1lowervalue) && (@two_results_R1 >= @two_criteria_C1uppervalue))
							@R1met = TRUE
						end	
					when '=<'
						if ((@two_results_R1 >= @two_criteria_C1lowervalue) && (@two_results_R1 <= @two_criteria_C1uppervalue))
							@R1met = TRUE
						end
					when '='
						if ((@two_results_R1 >= @two_criteria_C1lowervalue) && (@two_results_R1 == @two_criteria_C1uppervalue))
							@R1met = TRUE		
						end
					when ''
						if (@two_results_R1 >= @two_criteria_C1lowervalue)
							@R1met = TRUE
						end
					end
				when '=<'
					case @two_criteria_C1upperoperator[0]
					when '>'
						if ((@two_results_R1 <= @two_criteria_C1lowervalue) && (@two_results_R1 > @two_criteria_C1uppervalue))
							@R1met = TRUE
						end
					when '<'
						if ((@two_results_R1 <= @two_criteria_C1lowervalue) && (@two_results_R1 < @two_criteria_C1uppervalue))
							@R1met = TRUE
						end
					when '=>'
						if ((@two_results_R1 <= @two_criteria_C1lowervalue) && (@two_results_R1 >= @two_criteria_C1uppervalue))
							@R1met = TRUE
						end
					when '=<'
						if ((@two_results_R1 <= @two_criteria_C1lowervalue) && (@two_results_R1 <= @two_criteria_C1uppervalue))
							@R1met = TRUE
						end
					when '='
						if ((@two_results_R1 <= @two_criteria_C1lowervalue) && (@two_results_R1 == @two_criteria_C1uppervalue))
							@R1met = TRUE
						end
					when ''
						if (@two_results_R1 <= @two_criteria_C1lowervalue)
							@R1met = TRUE
						end
					end
				when '='
					puts "made it to first case"
					case @two_criteria_C1upperoperator[0]
					when '>'
						if ((@two_results_R1 == @two_criteria_C1lowervalue) && (@two_results_R1 > @two_criteria_C1uppervalue))
							@R1met = TRUE
						end
					when '<'
						if ((@two_results_R1 == @two_criteria_C1lowervalue) && (@two_results_R1 < @two_criteria_C1uppervalue))
							@R1met = TRUE
						end
					when '=>'
						if ((@two_results_R1 == @two_criteria_C1lowervalue) && (@two_results_R1 >= @two_criteria_C1uppervalue))
							@R1met = TRUE
						end
					when '=<'
						if ((@two_results_R1 == @two_criteria_C1lowervalue) && (@two_results_R1 <= @two_criteria_C1uppervalue))
							@R1met = TRUE
						end
					when '='
						puts "made it to second case"
						puts @two_results_R1[0]
						puts @two_criteria_C1lowervalue
						puts @two_criteria_C1uppervalue
						if ((@two_results_R1[0] == @two_criteria_C1lowervalue[0]) && (@two_results_R1[0] == @two_criteria_C1uppervalue[0]))
							puts "made it to set variable"
							@R1met = TRUE
						end
					when ''
						if (@two_results_R1 == @two_criteria_C1lowervalue)
							@R1met = TRUE
						end
					end
				end
				puts @two_criteria_C2upperoperator[0]	
				case @two_criteria_C2loweroperator[0]
				when '>'
					case @two_criteria_C2upperoperator[0]
					when '>'
						if ((@two_results_R2 > @two_criteria_C2lowervalue) && (@two_results_R1 > @two_criteria_C2uppervalue))
							@R2met = TRUE
						end
					when '<'
						if ((@two_results_R2 > @two_criteria_C2lowervalue) && (@two_results_R1 < @two_criteria_C2uppervalue))
							@R2met = TRUE
						end	
					when '=>'
						if ((@two_results_R2 > @two_criteria_C2lowervalue) && (@two_results_R1 >= @two_criteria_C2uppervalue))
							@R2met = TRUE
						end
					when '=<'
						if ((@two_results_R2 > @two_criteria_C2lowervalue) && (@two_results_R1 <= @two_criteria_C2uppervalue))
							@R2met = TRUE
						end
					when '='
						if ((@two_results_R2 > @two_criteria_C2lowervalue) && (@two_results_R1 == @two_criteria_C2uppervalue))
							@R2met = TRUE
						end
					when ''
						if (@two_results_R2 > @two_criteria_C2lowervalue)
							@R2met = TRUE
						end
					end
				when '<'
					case @two_criteria_C2upperoperator[1]
					when '>'
						if ((@two_results_R2 < @two_criteria_C2lowervalue) && (@two_results_R1 > @two_criteria_C2uppervalue))
							@R2met = TRUE
						end
					when '<'
						if ((@two_results_R2 < @two_criteria_C2lowervalue) && (@two_results_R1 < @two_criteria_C2uppervalue))
							@R2met = TRUE
						end
					when '=>'
						if ((@two_results_R2 < @two_criteria_C2lowervalue) && (@two_results_R1 >= @two_criteria_C2uppervalue))
							@R2met = TRUE
						end
					when '=<'
						if ((@two_results_R2 < @two_criteria_C2lowervalue) && (@two_results_R1 <= @two_criteria_C2uppervalue))
							@R2met = TRUE
						end
					when '='
						if ((@two_results_R2 < @two_criteria_C2lowervalue) && (@two_results_R1 == @two_criteria_C2uppervalue))
							@R2met = TRUE
						end
					when ''
						if (@two_results_R2 < @two_criteria_C2lowervalue)
							@R2met = TRUE
						end
					end
				when '=>'
					case @two_criteria_C2upperoperator[1]
					when '>'
						if ((@two_results_R2 >= @two_criteria_C2lowervalue) && (@two_results_R1 > @two_criteria_C2uppervalue))
							@R2met = TRUE
						end
					when '<'
						if ((@two_results_R2 >= @two_criteria_C2lowervalue) && (@two_results_R1 < @two_criteria_C2uppervalue))
							@R2met = TRUE
						end
					when '=>'
						if ((@two_results_R2 >= @two_criteria_C2lowervalue) && (@two_results_R1 >= @two_criteria_C2uppervalue))
							@R2met = TRUE
						end
					when '=<'
						if ((@two_results_R2 >= @two_criteria_C2lowervalue) && (@two_results_R1 <= @two_criteria_C2uppervalue))
							@R2met = TRUE
						end
					when '='
						if ((@two_results_R2 >= @two_criteria_C2lowervalue) && (@two_results_R1 == @two_criteria_C2uppervalue))
							@R2met = TRUE		
						end
					when ''
						if (@two_results_R2 >= @two_criteria_C2lowervalue)
							@R2met = TRUE
						end
					end
				when '=<'
					case @two_criteria_C2upperoperator[1]
					when '>'
						if ((@two_results_R2 <= @two_criteria_C2lowervalue) && (@two_results_R1 > @two_criteria_C2uppervalue))
							@R2met = TRUE
						end
					when '<'
						if ((@two_results_R2 <= @two_criteria_C2lowervalue) && (@two_results_R1 < @two_criteria_C2uppervalue))
							@R2met = TRUE
						end
					when '=>'
						if ((@two_results_R2 <= @two_criteria_C2lowervalue) && (@two_results_R1 >= @two_criteria_C2uppervalue))
							@R2met = TRUE
						end
					when '=<'
						if ((@two_results_R2 <= @two_criteria_C2lowervalue) && (@two_results_R1 <= @two_criteria_C2uppervalue))
							@R2met = TRUE
						end
					when '='
						if ((@two_results_R2 <= @two_criteria_C2lowervalue) && (@two_results_R1 == @two_criteria_C2uppervalue))
							@R2met = TRUE
						end
					when ''
						if (@two_results_R2 <= @two_criteria_C2lowervalue)
							@R2met = TRUE
						end
					end
				when '='
					case @two_criteria_C2upperoperator[0]
					when '>'
						if ((@two_results_R2 == @two_criteria_C2lowervalue) && (@two_results_R1 > @two_criteria_C2uppervalue))
							@R2met = TRUE
						end
					when '<'
						if ((@two_results_R2 == @two_criteria_C2lowervalue) && (@two_results_R1 < @two_criteria_C2uppervalue))
							@R2met = TRUE
						end
					when '=>'
						if ((@two_results_R2 == @two_criteria_C2lowervalue) && (@two_results_R1 >= @two_criteria_C2uppervalue))
							@R2met = TRUE
						end
					when '=<'
						if ((@two_results_R2 == @two_criteria_C2lowervalue) && (@two_results_R1 <= @two_criteria_C2uppervalue))
							@R2met = TRUE
						end
					when '='
						puts "Made it to last case"
						puts @two_criteria_C2uppervalue[1]	
						puts @two_results_R2[0]
						puts @two_criteria_C2lowervalue[1]
						if ((@two_results_R2[0] == @two_criteria_C2lowervalue[1]) && (@two_results_R2[0] == @two_criteria_C2uppervalue[1]))
							@R2met = TRUE
						end
					when ''
						if (@two_results_R2 == @two_criteria_C2lowervalue)
							@R2met = TRUE
						end
					end
				end
				p @R1met
				p @R2met
				if (@R1met && @R2met) == TRUE
					@two_output = TwoOutput.new({"R1"=>@two_results_R1, "R2"=>@two_results_R2})
					@two_output.save
				end
			end
		end
	end
	#pseudocode
	#for all results
	  #for all criteria
	    #if (R1 C1LC AND R1 C1UC) AND (R2 C2LC AND R2 C2UC) == TRUE write to output database 
	#show two_output.all

end
