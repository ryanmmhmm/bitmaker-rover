## Bitmaker NASA Mars Rover assignment

class	Rover
	attr_accessor :name, :start_position, :orders_from_NASA, :position, :facing

	def initialize(name, start_position, orders_from_NASA)
		@name = name
		@start_position = start_position
		@orders_from_NASA = orders_from_NASA
		@position[0] = @start_position[0]
		@position[1] = @start_position[1]
		@facing = @start_position[2]
	end
end

class Plateau
	attr_accessor :size, :grid

	def initialize(size)
		@size = size
		@grid = [(0...size),(0...size)]
	end
end