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

end

t = Tamagotchi.new

until t.alive == false 
	print "Action? "
	action = gets.chomp
	puts " "

	if action.downcase == 'inspect'
		t.inspect
	end

end