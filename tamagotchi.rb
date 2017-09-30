class Tamagotchi 

	@@stages = ["Baby", "Child", "Teen", "Adult"]
	attr_accessor :stage, :age, :weight, :hunger, :joy, :alive 

	def initialize
		@stage = @@stages[0]
		@age = 0
		@weight = rand(2..5)
		@hunger = 1
		@joy = 1
		@alive = true 
	end

	def inspect
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
			puts "om nom nom \n\n"			
		else 
			puts "Tamagotchi is already full.\n\n"
		end

	end

end

t = Tamagotchi.new

until t.alive == false 
	print "<< Action? "
	action = gets.chomp.downcase.gsub(/\s+/, "")
	puts " "

	if action == 'inspect'
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
