require_relative 'tile'

class Camera
	def initialize camx, camy, screenwidth, screenheight
		@camx = camx
		@camy = camy 
		@screenwidth = screenwidth
		@screenheight = screenheight
	end

	def update player
		@player = player
		@camx = @player.playerx - @screenwidth / 2 -16
		@camy = @player.playery - @screenheight / 2 - 16
	end

	def draw handler
		handler.draw(@camx, @camy)
	end
end