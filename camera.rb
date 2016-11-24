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

	def draw level, window
		@player.draw(window, @camx, @camy)
		level.each do |i|
			if not i.x < @camx - 64 and not i.x > @camx + @screenwidth + 64
				i.draw(window, @camx, @camy)
			end
		end	
	end
end