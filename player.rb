require 'Gosu'

class Player
	attr_accessor :playerx, :playery, :speed, :gravity

	def initialize screenwidth, screenheight, tilesize
		@playerx = screenwidth/2 - 16
		@playery = screenheight/2 -16
		@color = Gosu::Color.argb(0xff_00ff00)
		@speed = 5
		@gravity = 4
		@tilesize = tilesize
	end
	def update
		@playery += @gravity
	end
	def draw window, camx, camy
		window.draw_quad(@playerx - camx, @playery - camy, @color, 
			@playerx + @tilesize - camx, @playery - camy, @color, 
			@playerx-camx, @playery+ @tilesize - camy, @color, 
			@playerx+ @tilesize - camx, @playery + @tilesize - camy, @color, 2, mode = :default)
	end
end
