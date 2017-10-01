require 'timeout'

class Tamagotchi 

	@@stages = ["Baby", "Child", "Teen", "Adult"]
	attr_accessor :stage, :age, :weight, :hunger, :joy, :alive 

	def initialize
		@dob = Time.now 
		@weight = rand(2..5)
		@hunger = 1
		@joy = 1
		@alive = true 
	end

	def calculate_age
		@age = ((Time.now - @dob)/15).floor
	end


	def inspect
		puts "DOB: #{@dob}"
		puts "Stage: #{@stage}"
		puts "Age: #{@age} yr"
		puts "Weight: #{@weight} oz"
		puts "Hunger: #{@hunger}/4"
		puts "Joy #{@joy}/4"
		puts "Alive: #{@alive} \n\n"
	end

	def suicide 
		@alive = false 
	end

	def eat
		if @hunger < 4
			@hunger = @hunger + 1 
			@weight = @weight + rand(2..4)
			puts "om nom nom \n\n"			
		else 
			puts "Tamagotchi is already full.\n\n"
		end
	end

	def alive_check
		if @hunger == 0 && @joy == 0
			@alive = false
		end
	end

	def calculate_stage
		if @age < 2
			@stage = @@stages[0]
		elsif @age.between?(2, 13) 
			@stage = @@stages[1]
		elsif @age.between?(13,18) 
			@stage = @@stages[2]
		elsif @age > 18 
			@stage = @@stages[3]
		end	
	end

end

t = Tamagotchi.new

until t.alive == false 
t.alive_check
t.calculate_age
t.calculate_stage
action = ""

	begin
			print "<< Action? "
		  action = Timeout::timeout(15) do
		  	gets.chomp.downcase.gsub(/\s+/, "")
	  	end
		rescue Timeout::Error
	end

	if action.empty?
		puts "\n" 

	elsif action == 'inspect'
		t.inspect

	elsif action == 'suicide'
		t.suicide

	elsif action == 'help'
		puts "inspect, suicide, help... \n\n"
	
	elsif action == 'feed'
		t.eat	

	else
		puts "Unknown action. Type 'help' for a complete list. \n\n"
	end

end

# when alive != true 
puts "Tamagotchi, a #{t.age} year-old #{t.stage.downcase} weighing #{t.weight} oz, has died."
