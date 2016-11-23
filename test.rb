require 'Gosu'
require_relative 'camera'
require_relative 'player'
require_relative 'background'

class Window < Gosu::Window

	def initialize width = 800, height = 600, fullscreen = false
		super
		
		self.caption = "camera test"

		@tilesize = 32
        @new_press_return,  
        @new_press_left, 
        @new_press_right, 
        @new_press_space, 
        @new_press_escape = false

		@background = Background.new(@tilesize)
		@cam = Camera.new(0,0,width,height)
		@player = Player.new(width, height, @tilesize)
		
	end

	def collision
		@background.level.each do |t|
			if @player.playery + @tilesize > t.y and 
				@player.playery < t.y + @tilesize and 
				@player.playerx < t.x + @tilesize and 
				@player.playerx + @tilesize > t.x

				if @player.playery + @tilesize > t.y 
					@player.playery -= @player.gravity
				end
				if @player.playery < t.y + @tilesize

				end
				if @player.playerx < t.x + @tilesize

				end
				if @player.playerx + @tilesize > t.x

				end

				t.color = Gosu::Color.argb(0xff_ff0000) # red to see whose colliding
			else
				t.color = Gosu::Color.argb(0xff_00ffff) # cyan
			end
		end
	end

	def update
		@player.update
		collision
		@cam.update(@player)

		if button_down?(Gosu::KbReturn) && @new_press_enter
                           
        end

        if button_down?(Gosu::KbLeft)
        	@player.playerx -= @player.speed                   
        end

        if button_down?(Gosu::KbRight)
        	@player.playerx += @player.speed                                    
        end

        if button_down?(Gosu::KbEscape) && @new_press_escape
        	self.close                   
        end

		@enter, @up, @down, @left, @right, @space, @escape, @tab = false 	
		
		@new_press_enter = !button_down?(Gosu::KbReturn)        
        @new_press_left = !button_down?(Gosu::KbLeft)
        @new_press_right = !button_down?(Gosu::KbRight)
        @new_press_space = !button_down?(Gosu::KbSpace)
        @new_press_escape = !button_down?(Gosu::KbEscape)
	end

	def draw
		@cam.draw(@background.level, self)
	end
end

Window.new.show