class Collision

	def initialize tilesize
		@tilesize = tilesize
	end
	
	def collide player, level
		level.each do |t|
			if player.playery + @tilesize > t.y and 
				player.playery < t.y + @tilesize and 
				player.playerx < t.x + @tilesize and 
				player.playerx + @tilesize > t.x

				if player.playery + @tilesize > t.y # ground collision
					player.playery -= player.gravity
					player.onground = true
				end
				if player.playery < t.y + @tilesize # top collision

				end
				if player.playerx < t.x + @tilesize # left collision
					player.playerx + player.speed
				end
				if player.playerx + @tilesize > t.x # right collision
					player.playerx - player.speed
				end

				t.color = Gosu::Color.argb(0xff_ff0000) # red to see whose colliding
			else
				t.color = Gosu::Color.argb(0xff_00ffff) # cyan
			end
		end
	end
end