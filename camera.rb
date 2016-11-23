
class Camera
	def initialize camx, camy, screenwidth, screenheight
		@camx = camx
		@camy = camy 
		@screenwidth = screenwidth
		@screenheight = screenheight
	end

	def update player
		@player = player
		@camx = @player.playerx - @screenwidth / 2
		@camy = @player.playery - @screenheight / 2

	end

	def draw level, window
		@player.draw(window, @screenwidth / 2)
		level.each do |i|
			i.draw(window)
			if not i.x < @camx - 98 and not i.x > @camx + @screenwidth
				#i.draw(window)
			end
		end
	end
end