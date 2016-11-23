require 'Gosu'
require_relative 'camera'
require_relative 'player'
require_relative 'background'

class Window < Gosu::Window

	def initialize width = 800, height = 600, fullscreen = false
		super
		
		self.caption = "camera test"
		@background = Background.new(width, height)
		@gamewidth = @background.level.size * 32
		@cam = Camera.new(0,0,width,height)
		@player = Player.new(width, height)
		@tilesize = 32
        @new_press_return,  
        @new_press_left, 
        @new_press_right, 
        @new_press_space, 
        @new_press_escape = false
        @collide = false
	end

	def collision
		@background.level.each do |t|
			if @player.playery + @tilesize > t.y and @player.playery < t.y + @tilesize and @player.playerx < t.x + @tilesize and @player.playerx + @tilesize > t.x
				@collide = true
				@player.playery -= 1
				t.color = Gosu::Color.argb(0xff_ff0000)
			else
				@collide = false
				t.color = Gosu::Color.argb(0xff_00ffff) 
			end

			if @collide == true
				
			elsif @collide == false
				
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