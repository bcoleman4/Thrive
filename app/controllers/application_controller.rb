class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	def atest
	  @two_results = TwoResult.all

	end

	def auto2   
	  #clear the database records
	  TwoResult.destroy_all

	  #create all of the combinations and insert into database
	  for bRes in 1..10
	    for aRes in 1..10
	      @two_result = TwoResult.new({"R1"=>aRes, "R2"=>bRes})
	      @two_result.save
	    end
	  end
	end

	def output2
		@met = FALSE
		TwoOutput.destroy_all

		@resultcount = 0
		@criteriacount = 0
		@arow = 0
		@rescol = 1
		@alowvalcol = 1
		@alowcricol = 2
		@ahivalcol = 3
		@ahicricol = 4
		@blowvalcol = 5
		@blowcricol = 6
		@bhivalcol = 7
		@bhicricol = 8

		lessthan = :<
		greaterthan = :>
		lessthanequalto = :<=
		greaterthanequalto = :>=
		equalto = :==
		nothing = :''

		db = SQLite3::Database.open( "db/development.sqlite3" ) 
		@tworesult = db.execute( "select * from two_results" )
		@tworesult.flatten!
		@twocriteria = db.execute ( "select * from two_criteria" )
		@tworesultcounta = db.execute ( "select count(*) from two_results" )
		@tworesultcountb = @tworesultcounta.fetch(0)
		@tworesultcount = @tworesultcountb.fetch(0)
		@twocriteriacounta = db.execute ( "select count(*) from two_criteria" )
		@twocriteriacountb = @twocriteriacounta.flatten!
		@twocriteriacount = @twocriteriacountb[0]
		print String(@twocriteriacountb[0]) << " @twocriteriacountb "
		puts " "
		until @rescol == 2 do
			until @resultcount == @tworesultcount do
				until @criteriacount == (@twocriteriacount) do
					print "@resultcount is #{@resultcount}"
					puts " "
					print "@tworesultcount is #{@tworesultcount}"
					puts " "
					print "@criteriacount is #{@criteriacount}"
					puts " "
					print "@twocriteriacount is #{@twocriteriacount}"
					puts " "
					print "@alowcricol is #{@alowcricol}"
					puts " "
					print "@twocriteria is #{@twocriteria}"
					puts " "
					print "@twocriteria[@criteriacount][@alowcricol]) is #{@twocriteria[@criteriacount][@alowcricol]}"
					puts " "
					print "@twocriteria[0][1] is #{@twocriteria[0][1]}"
					puts " "
					print "@twocriteria[0][2] is #{@twocriteria[0][2]}"
					puts " "
					print "@twocriteria[1][3] is #{@twocriteria[1][3]}"
					puts " "
					print "@twocriteria[1][4] is #{@twocriteria[1][4]}"
					puts " "
					print String("End of print batch")
					puts " "
					puts " "
					@aif = @twocriteria[@criteriacount][@alowcricol]
					puts " "
					@bif = @twocriteria[@criteriacount][@ahicricol]
					print "@aif is #{@aif}"
					puts " "
					print "@bif is #{@bif}"
					puts " "
					print "@aif == 5 is #{@aif == "5"}"
					puts " "
					if @aif == "5"
					#if ((@twocriteria[@criteriacount][@alowcricol]) == 5)
						print "That worked"
						puts " "
					else
						print "That didn't work"
						puts " "
						print equalto
					end
						
					case @aif
					#case @twocriteria[@criteriacount][@alowcricol]
						when "1"
							@lowcriteria = greaterthan
						when "2"
							@lowcriteria = lessthan
						when "3"
							@lowcriteria = greaterthanequalto
						when "4"
							@lowcriteria = lessthanequalto
						when "5"
							puts "Made it here 1"
							puts " "
							@lowcriteria = equalto
						when ''
							"Made it here by mistake"
							puts " "
							#TODO
					end
					puts "Made it here 2"
					case @bif
					#case @twocriteria[@criteriacount][@ahicricol]
						when "1"
							@hicriteria = greaterthan
						when "2"
							@hicriteria = lessthan
						when "3"
							@hicriteria = greaterthanequalto
						when "4"
							@hicriteria = lessthanequalto
						when "5"
							@hicriteria = equalto
						when "6"
							#TODO
					end
					print String( " Second batch of prints ")
					puts " "
					print "@criteriacount is #{@criteriacount}"
					puts " "
					print "@rescol is #{@rescol}"
					puts " "
					print "@resultcount is #{@resultcount}"
					puts " "
					print String(@tworesult[@resultcount][@rescol]) << ( " @tworesult[@resultcount][@rescol] " )
					puts " "
					print String(@twocriteria) << ( " @twocriteria " )
					puts " "
					print String(@lowcriteria) << ( " @lowcriteria ")
					puts " "
					print String(@twocriteria[@criteriacount][@alowvalcol]) << ( " @twocriteria[@criteriacount][@alowvalcol] " )
					puts " "
					#print String(@tworesult[@resultcount][@rescol].public_send(@lowcriteria, @twocriteria[@criteriacount][@alowvalcol])) << ("First if check")
					#puts " "
					#print String(@tworesult[@resultcount][@ahivalcol].public_send(@hicriteria, @twocriteria[@criteriacount][@ahivalcol]))	<< ("Second if check")
					#puts " "
					print String( " End of second batch of prints " )
					puts " "
					puts " "
					print "(@tworesult[@resultcount][@rescol].public_send(@lowcriteria, @twocriteria[@criteriacount][@alowvalcol])) is #{(@tworesult[@resultcount][@rescol].public_send(@lowcriteria, @twocriteria[@criteriacount][@alowvalcol]))}" 
					puts " "
					print "@tworesult[@resultcount][@rescol] is #{@tworesult[@resultcount][@rescol]}"
					puts " "
					print "@lowcriteria is #{@lowcriteria}"
					puts " "
					print "@twocriteria[@criteriacount][@alowvalcol] is #{@twocriteria[@criteriacount][@alowvalcol]}"
					puts " "
					if ((@tworesult[@resultcount][@rescol].public_send(@lowcriteria, @twocriteria[@criteriacount][@alowvalcol])) && (@tworesult[@resultcount][@ahivalcol].public_send(@hicriteria, @twocriteria[@criteriacount][@ahivalcol])))
						if @rescol == 1
							@ares = @tworesults[@resultcount][@rescol]
						elsif @rescol == 2
							@bres = @tworesults[@resultcount][@rescol]
						end
					@met = TRUE
					end
					print "@ares is #{@ares}"
					puts " "
					print "@bres is #{@bres}"
					puts " "
					@criteriacount = @criteriacount + 1
				end
			@resultcount = @resultcount+1
			end
			if @met = TRUE
				@two_output = TwoOutput.new({"O1"=>@ares, "O2"=>@bres})
				@two_output.save
				@met = FALSE
			end
		@rescol = @rescol+1
		end
		#@atest = TwoResult.all
		#until a == @atest.count do
		#	puts @atest[a][1]
		#	puts @atest[a][2]
		#	a = a+1
		#end
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
