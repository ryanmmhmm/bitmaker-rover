## Bitmaker NASA Mars Rover assignment

class	Rover
	attr_accessor :name, :start_position, :orders_from_NASA, :position, :facing

	def initialize(name, start_position, orders_from_NASA)
		@name = name
		@start_position = start_position
		@orders_from_NASA = orders_from_NASA

		@position = [0..1]
		@position[0] = @start_position[0]
		@position[1] = @start_position[1]
		@facing = @start_position[2]
	end

	def hi
		puts "Hi, I'm Rover #{@name}"
	end
end


class Plateau
	attr_accessor :size, :grid

	def initialize(size)
		@size = size
		@grid = [(0...size),(0...size)]
	end
end


## Init variables sent from NASA
rover1_position = [1,2,"N"]
rover2_position = [3,3,"E"]

# movement directions for the rover(s)
rover1_directions = ["L","M","L","M","L","M","L","M","M"]
rover2_directions = ["M","M","R","M","M","R","M","R","R","M"]

# instantiate two mars rovers with the above variables
adam = Rover.new("Adam", rover1_position, rover1_directions)
eve = Rover.new("Eve", rover2_position, rover2_directions)

adam.hi
eve.hi
