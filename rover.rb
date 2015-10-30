## Bitmaker NASA Mars Rover assignment

# require_relative 'NASA.rb'  # put init values into separate file
class Plateau
	attr_accessor :plateau_name, :size, :grid

	def initialize(name, size)
		@plateau_name = name
		@size = size
		@grid = [(0...size),(0...size)]

		puts "A plateau on #{@plateau_name} has been discovered that is #{@size} x #{@size} large."
		puts "Let's explore it!"
		puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*"
	end
end

class	Rover
	attr_reader :plateau_name, :plateau_size, :grid  # init from Plateau class
	attr_accessor :name, :start_position, :orders_from_NASA, :position, :facing, :rovers

	@@COMPASS = ["N", "E", "S", "W"]  # set the reference for the directions the rover can face

	def initialize(plateau_name, plateau_size, grid, name, start_position, orders_from_NASA)
		@plateau_name = plateau_name
		@plateau_size = plateau_size
		@grid = grid

		@name = name
		@start_position = start_position
		@orders_from_NASA = orders_from_NASA.split('')

		# init position of rover
		@position = [0..1]
		@position[0] = @start_position[0]
		@position[1] = @start_position[1]

		#init direction that rover is facing
		@facing = @@COMPASS.rotate(@@COMPASS.index(@start_position[2]))
		@is_facing = @facing[0]
	end

	def process_orders
		@orders_from_NASA.each do |order|
			case order
			when "R" then self.turn(order)
			when "L" then self.turn(order)
			when "M" then self.move
			else
				puts "That is not a valid order."
			end
		end
	end

	def turn(change_direction)
		case change_direction
		when "R" then @facing = @facing.rotate(1)
		when "L" then @facing = @facing.rotate(-1)
		end

		self.is_facing
	end

	def is_facing
		puts "#{@name} is facing #{@facing[0]}."
		@is_facing = @facing[0]
	end

	def move
		case @is_facing
		when "N" then @position[1] += 1  # inc y coordinate
		when "E" then @position[0] += 1  # inc x coordinate
		when "W" then @position[0] -= 1  # dec x coordinate
		when "S" then @position[1] -= 1  # dec y coordinate
		else
			puts "That is not a valid direction."
		end

		puts "#{@name} is now at position #{@position}"
	end

	def hi
		puts "Hi, I'm Rover #{@name}!"
		puts "I'm located on plateau #{@plateau_name}."  # how can i call an instance variable from another class?
		puts "My start_position is #{@start_position}."
		puts "My position is #{@position}."
		puts "I'm currently facing #{@is_facing}."
		puts "*********"
	end
end


## Init variables sent from NASA
plateau_name = "Mars"
rover1_position = [1, 2, "N"]
rover2_position = [3, 3, "E"]
plateau_size = 10

# movement directions for the rover(s)
rover1_directions = "LMLMLMLMM"
rover2_directions = "MMRMMRMRRM"

mars = Plateau.new(plateau_name, plateau_size)

# instantiate two mars rovers with the above variables
adam = Rover.new(plateau_name, plateau_size, grid = [(0...plateau_size,0...plateau_size], "Adam", rover1_position, rover1_directions)
eve = Rover.new(plateau_name, plateau_size, grid = [0...plateau_size,0...plateau_size], "Eve", rover2_position, rover2_directions)
adam
eve

adam.hi
eve.hi


adam.process_orders
eve.process_orders

# adam.name
# adam.start_position
# adam.position
# adam.facing
