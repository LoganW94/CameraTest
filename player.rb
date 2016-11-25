require 'Gosu'

class Player
	attr_accessor :playerx, :playery, :speed, :gravity, :jumpframes, :maxjframes, :onground, :canjump, :can_move_right, :can_move_left

	def initialize screenwidth, screenheight, tile_size
		@playerx = screenwidth/2 - 16
		@playery = screenheight/2 -16
		@color = Gosu::Color.argb(0xff_00ff00)
		@speed = 5
		@gravity = 5
		@jumprate = 10
		@tile_size = tile_size
		@jumpframes = 0
		@maxjframes = 20

		can_move_right,
		can_move_left = true
	end
	def update
		@playery += @gravity
		jump		
	end

	def jump
		if @canjump == true and @jumpframes < @maxjframes
        	@playery -= @jumprate
        	@jumpframes += 1
        elsif @jumpframes >= @maxjframes
        	@jumpframes = 0
        	@canjump = false
        	@onground = false
        end
	end
	def draw window, camx, camy
		window.draw_quad(@playerx - camx, @playery - camy, @color, 
			@playerx + @tile_size - camx, @playery - camy, @color, 
			@playerx-camx, @playery+ @tile_size - camy, @color, 
			@playerx+ @tile_size - camx, @playery + @tile_size - camy, @color, 2, mode = :default)
	end
end
