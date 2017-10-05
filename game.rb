require_relative 'tamagotchi'

tom = Tom.new

loop do 
tom.checks
break if tom.alive == false
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
		tom.inspect

	elsif action == 'suicide'
		tom.suicide

	elsif action == 'help'
		puts "inspect, suicide, help... \n\n"
	
	elsif action == 'feed'
		tom.eat	

	elsif action == 'play'
		tom.play

	else
		puts "Unknown action. Type 'help' for a complete list. \n\n"
	end

end

# when alive != true 
puts "------------\n\nTom has died! \n\n"
tom.inspect
