require_relative 'tile'

class Background

	attr_accessor :level
	def initialize tilesize, screenwidth
		@screenwidth = screenwidth
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

	def draw window, camx, camy
		@level.each do |i|
			if not i.x < camx - 64 and not i.x > camx + @screenwidth + 64
				i.draw(window, camx, camy)
			end
		end	
	end
end
