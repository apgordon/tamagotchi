class Tamagotchi 

	@@stages = ["Baby", "Child", "Teen", "Adult"]
	attr_accessor :stage, :age, :weight 

	def initialize
		@stage = @@stages[0]
		@age = 0
		@weight = rand(2..5)
	end

	def inspect
		puts "Stage: #{@stage}"
		puts "Age: #{@ago}"
		puts "Weight: #{@weight}"
	end

end

t = Tamagotchi.new
t.inspect