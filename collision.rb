require_relative 'utils'

class Collision

	def initialize tile_size
		@tile_size = tile_size
	end

	def tile_collide player, level
		level.each do |t|
			if player.playery + @tile_size >= t.y and 
				player.playery <= t.y + @tile_size and 
				player.playerx <= t.x + @tile_size and 
				player.playerx + @tile_size >= t.x

				collide_right(player, t)
				collide_left(player, t)
				collide_top(player, t)
				collide_bottom(player, t)
			
				t.color = Gosu::Color.argb(0xff_ff0000) # red to see whose colliding
			else
				player.can_move_left = true
				player.can_move_right = true
				t.color = Gosu::Color.argb(0xff_00ffff) # cyan
			end
		end
	end

	def collide_left player, t
		if player.playerx <= t.x + @tile_size
			#player.playerx = t.x + @tile_size + 1
			player.can_move_left = false
			#eturn true
		end
	end
	def collide_right player, t
		if player.playerx + @tile_size >= t.x
			#player.playerx = t.x - @tile_size - 1
			player.can_move_right = false
			#return true
		end
	end
	def collide_bottom player, t
		if player.playery + @tile_size  >= t.y #and Utils.new.distance(player.playery, t.y) <= 16
			player.playery = t.y - @tile_size - 5
			player.onground = true
			#return true
		else
			player.onground = false
		end
	end
	def collide_top player, t
		if player.playery <= t.y + @tile_size
		end
	end
end