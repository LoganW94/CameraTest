require 'Gosu'

class Tile
	attr_accessor :x, :y, :color
	def initialize x, y
		@x = x
		@y = y
		@color = Gosu::Color.argb(0xff_00ffff)
		@tile_size = 32 
	end

	def update
		
	end

	def draw window
		window.draw_quad(@x, @y, @color, @tile_size + @x, @y, @color, @x, @tile_size + @y, @color, @tile_size + @x, @tile_size + @y, @color, 2, mode = :default)
	end
end