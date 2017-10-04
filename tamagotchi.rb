require 'timeout'

class Tamagotchi 

	@@stages = ["Baby", "Child", "Teen", "Adult"]
	attr_accessor :stage, :age, :weight, :hunger, :joy, :alive 

	def initialize
		@dob = Time.now 
		@weight = rand(2..5)
		@hunger = 1
		@hunger_reset_timer = Time.now
		@joy_reset_timer = Time.now
		@joy = 1
		@alive = true 
	end

	def inspect
		#puts "DOB: #{@dob}"
		puts "Stage: #{@stage}"
		puts "Age: #{@age} yr"
		if @weight >= 16
			puts "Weight: #{(@weight/16).floor} lbs, #{@weight % 16} oz"
		else
			puts "Weight: #{@weight} oz"
		end
		puts "Hunger: #{@hunger}/4"
		puts "Joy #{@joy}/4 \n\n"
	end

	def suicide 
		@alive = false 
	end

	def eat
		if @hunger < 4
			@hunger += 1 
			@weight = @weight + rand(4..7)
			puts "Om nom nom... \n\n"			
			@hunger_reset_timer = Time.now 
		else 
			puts "Tamagotchi is already full.\n\n"
		end
	end

	def play
		if @joy < 4
			@joy += 1 
			puts "Play play play... \n\n"			
			@joy_reset_timer = Time.now 
		else 
			puts "Tamagotchi is already very happy.\n\n"
		end
	end

	def alive_check
		if @hunger < 1 || @joy < 1
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

	def calculate_age
		@age = ((Time.now - @dob)/15).floor
	end

	def calculate_hunger
		if Time.now > @hunger_reset_timer + 30
			@hunger -= 1
			@hunger_reset_timer = Time.now
		end
		# self.calculate_weight ... weight should decrease sligthly if not for a long time
	end

	def calculate_weight
	end

	def calculate_joy
		if Time.now > @joy_reset_timer + 30
			@joy -= 1
			@joy_reset_timer = Time.now
		end
		#weight should decrease sligthly if not for a long time
	end

end

t = Tamagotchi.new

until t.alive == false 
t.calculate_hunger
t.calculate_joy
t.calculate_age
t.calculate_stage
t.alive_check
break if t.alive_check == false
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

	elsif action == 'play'
		t.play

	else
		puts "Unknown action. Type 'help' for a complete list. \n\n"
	end

end

# when alive != true 
puts "------------\n\nTamagotchi has died! \n\n"
t.inspect
