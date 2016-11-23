require_relative 'tile'

class Background

	attr_accessor :level
	def initialize tilesize
			@tilesize = tilesize
			create_level
	end

	def create_level
		@level = []
		x = 0
		y = 500
		for i in 0...40
			tile = Tile.new(x,y,@tilesize)
			@level << tile
			x += @tilesize
		end
	end
end
