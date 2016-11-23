require 'Gosu'

class Tile
	attr_accessor :x, :y, :color
	def initialize x, y, tilesize
		@x = x
		@y = y
		@color = Gosu::Color.argb(0xff_00ffff)
		@tilesize = tilesize
	end
	
	def draw window, camx, camy
		@x -= camx
		@y -= camy
		window.draw_quad(@x, @y, @color, @tilesize + @x, @y, @color, @x, @tilesize + @y, @color, @tilesize + @x, @tilesize + @y, @color, 2, mode = :default)
	end
end