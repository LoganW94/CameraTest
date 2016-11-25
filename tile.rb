require 'Gosu'

class Tile
	attr_accessor :x, :y, :color
	def initialize x, y, tile_size
		@x = x
		@y = y
		@color = Gosu::Color.argb(0xff_00ffff)
		@tile_size = tile_size
	end

	def draw window, camx, camy
		window.draw_quad(@x - camx, @y - camy, @color, 
			@tile_size + @x - camx, @y - camy, @color, 
			@x - camx, @tile_size + @y - camy, @color, 
			@tile_size + @x - camx, @tile_size + @y - camy, @color, 1, mode = :default)
	end
end