require 'Gosu'

class Player
	attr_accessor :playerx, :playery, :speed

	def initialize screenwidth, screenheight
		@playerx = screenwidth/2 - 16
		@playery = screenheight/2 -16
		@color = Gosu::Color.argb(0xff_00ff00)
		@speed = 5
		@gravity = 1
	end
	def update
		@playery += @gravity
	end
	def draw window, camx, camy
		window.draw_quad(@playerx - camx, @playery - camy, @color, @playerx + 32 - camx, @playery - camy, @color, @playerx-camx, @playery+ 32 - camy, @color, @playerx+ 32 - camx, @playery+ 32 - camy, @color, 3, mode = :default)
	end
end
