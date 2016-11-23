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
	def draw window, x
		window.draw_quad(x, @playery, @color, x+ 32, @playery, @color, x, @playery+ 32, @color, x+ 32, @playery+ 32, @color, 3, mode = :default)
	end
end
