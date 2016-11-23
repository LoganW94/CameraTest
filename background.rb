require_relative 'tile'

class Background

	attr_accessor :level
	def initialize screenwidth, screenheight
			@screenwidth = screenwidth
			@screenheight = screenheight
			create_level
	end

	def update
	end

	def create_level
		@level = []
		x = 0
		y = 500
		for i in 0...30
			tile = Tile.new(x,y)
			@level << tile
			x += 32
		end
	end
end
