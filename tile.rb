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
		window.draw_quad(@x - camx, @y - camy, @color, @tilesize + @x - camx, @y - camy, @color, @x - camx, @tilesize + @y - camy, @color, @tilesize + @x - camx, @tilesize + @y - camy, @color, 2, mode = :default)
	end
end