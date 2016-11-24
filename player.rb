require 'Gosu'

class Player
	attr_accessor :playerx, :playery, :speed, :gravity, :jumpframes, :maxjframes

	def initialize screenwidth, screenheight, tilesize
		@playerx = screenwidth/2 - 16
		@playery = screenheight/2 -16
		@color = Gosu::Color.argb(0xff_00ff00)
		@speed = 5
		@gravity = 5
		@jumprate = 10
		@tilesize = tilesize
		@jumpframes = 0
		@maxjframes = 20
	end
	def update
		@playery += @gravity
	end

	def jump
		@playery -= @jumprate
	end
	def draw window, camx, camy
		window.draw_quad(@playerx - camx, @playery - camy, @color, 
			@playerx + @tilesize - camx, @playery - camy, @color, 
			@playerx-camx, @playery+ @tilesize - camy, @color, 
			@playerx+ @tilesize - camx, @playery + @tilesize - camy, @color, 2, mode = :default)
	end
end
