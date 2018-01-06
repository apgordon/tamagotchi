require 'timeout'

class Tom 

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
		# include height at some point 
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
			puts "Om nom nom... Hunger: +1\n\n"			
			@hunger_reset_timer = Time.now 
		else 
			puts "Tom is already full.\n\n"
		end
	end

	def play
		if @joy < 4
			n = 0
			correct = 0 
			until n == 5 
				print "Even (e) or Odd (o)? "
				guess = gets.chomp.downcase.gsub(/\s+/, "")
				rand_num = rand(1..10)
				rand_num_string = "Tom was thinking of the number #{rand_num}. \n\n"
					if (rand_num.even? && guess == 'e')
						puts "Correct! " + rand_num_string
						correct = correct + 1
					else
						puts "Wrong!" + rand_num_string 
					end
				n += 1 
			end
			if correct >= 3
				puts "Tom is pleased. Joy: +1. \n\n"
				@joy += 1
				@joy_reset_timer = Time.now 
			end

		else 
			puts "Tom is already very happy.\n\n"
		end
	end

	def calculate_hunger
		if Time.now > @hunger_reset_timer + 30
			@hunger -= 1
			@hunger_reset_timer = Time.now
		end
		# self.calculate_weight ... weight should decrease sligthly if not for a long time
	end

	def calculate_joy
		if Time.now > @joy_reset_timer + 30
			@joy -= 1
			@joy_reset_timer = Time.now
		end
		#weight should decrease sligthly if not for a long time
	end

	def calculate_age
		@age = ((Time.now - @dob)/15).floor
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
	
	def calculate_weight
	end

	def checks
		calculate_hunger
		calculate_joy
		calculate_age
		calculate_stage
		alive_check
	end

	def alive_check
		if @hunger < 1 || @joy < 1
			@alive = false
		end
	end

end

