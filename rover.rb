## Bitmaker NASA Mars Rover assignment

# require_relative 'NASA.rb'  # put init values into separate file

class	Rover
	attr_accessor :name, :start_position, :orders_from_NASA, :position, :facing

	@@COMPASS = ["N", "E", "S", "W"]  # set the reference for the directions the rover can face

	def initialize(name, start_position, orders_from_NASA)
		@name = name
		@start_position = start_position
		@orders_from_NASA = orders_from_NASA

		# init position of rover
		@position = [0..1]
		@position[0] = @start_position[0]
		@position[1] = @start_position[1]

		#init direction that rover is facing
		@facing = @@COMPASS.rotate(@@COMPASS.index(@start_position[2]))
	end

	def turn(change_direction)
		case change_direction
		when 1 then @facing = @facing.rotate(1)
		when -1 then @facing = @facing.rotate(-1)
		end

		self.is_facing
	end

	def is_facing
		@is_facing = @facing[0]
		puts "#{@name} is now facing #{@is_facing[0]}"
	end

	def process_orders(position, facing, orders_from_NASA)
		orders_from_NASA.each do |order|
			case order
			when "L" then self.turn(-1)
			when "R" then self.turn(1)
			when "M" then self.move
			else
				puts "That is not a valid order."
			end
		end
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
	end

	def hi
		puts "Hi, I'm Rover #{@name}"
		puts "My start_position is #{@start_position}."
		puts "I'm currently facing #{@facing[0]}."
		puts "My position is #{@position}"
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
rover1_position = [1, 2, "N"]
rover2_position = [3, 3, "E"]

# movement directions for the rover(s)
rover1_directions = "LMLMLMLMM"
rover2_directions = "MMRMMRMRRM"

# instantiate two mars rovers with the above variables
adam = Rover.new("Adam", rover1_position, rover1_directions)
eve = Rover.new("Eve", rover2_position, rover2_directions)

adam.hi
eve.hi

adam.turn(1)
adam.turn(1)
adam.turn(1)
adam.turn(1)
adam.turn(-1)
adam.turn(-1)
adam.turn(-1)
adam.turn(-1)

# adam.name
# adam.start_position
# adam.position
# adam.facing
