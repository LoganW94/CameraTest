require_relative 'tile'

class Camera
	def initialize camx, camy, screen_width, screen_height
		@camx = camx
		@camy = camy 
		@screen_width = screen_width
		@screen_height = screen_height
	end

	def update player
		@player = player
		@camx = @player.playerx - @screen_width / 2
		@camy = @player.playery - @screen_height / 2
	end

	def draw handler
		@handler = handler
		handler.draw(@camx, @camy)
	end
end