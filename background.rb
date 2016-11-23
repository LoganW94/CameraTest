require_relative 'tile'

class Background

	attr_accessor :level
	def initialize screenwidth, screenheight, tilesize
			@screenwidth = screenwidth
			@screenheight = screenheight
			@tilesize = tilesize
			create_level
	end

	def create_level
		@level = []
		x = 0
		y = 500
		for i in 0...30
			tile = Tile.new(x,y,@tilesize)
			@level << tile
			x += @tilesize
		end
	end
end
