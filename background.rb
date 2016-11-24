require_relative 'tile'

class Background

	attr_accessor :level
	def initialize tilesize
			@tilesize = tilesize
			create_level
	end

	def create_level
		@level = []
		tile_1 = Tile.new(320, 468, @tilesize)
		tile_2 = Tile.new(320, 436, @tilesize)
		level << tile_1
		level << tile_2
		x = 0
		y = 500
		for i in 0...40
			tile = Tile.new(x,y,@tilesize)
			@level << tile
			x += @tilesize
		end

	end
end
