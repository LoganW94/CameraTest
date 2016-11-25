require_relative 'tile'

class Background

	attr_accessor :level, :in_view

	def initialize tile_size, screenwidth
		@screenwidth = screenwidth
		@tile_size = tile_size
		create_level
	end

	def create_level
		@level = []
		tile_1 = Tile.new(320, 468, @tile_size)
		tile_2 = Tile.new(320, 436, @tile_size)
		level << tile_1
		level << tile_2
		x = 0
		y = 500
		for i in 0...40
			tile = Tile.new(x,y,@tile_size)
			@level << tile
			x += @tile_size
		end
	end

	def draw window, camx, camy
		@in_view = []
		@level.each do |i|
			if not i.x < camx - 64 and not i.x > camx + @screenwidth + 64
				i.draw(window, camx, camy)
				@in_view << i
			end
		end	
	end
end
