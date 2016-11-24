require 'Gosu'
require_relative 'collision'
require_relative 'player'
require_relative 'background'

class Handler 
	attr_accessor :player

	def initialize window, width, height
		@window = window
		@tilesize = 32

		@collision_detect = Collision.new(@tilesize)
        @player = Player.new(width, height, @tilesize)
        @background = Background.new(@tilesize, width)

		@new_press_return,  
        @new_press_left, 
        @new_press_right, 
        @new_press_space, 
        @new_press_escape = false

        @level = @background.level
	end

	def update
		@player.update
		@collision_detect.collide(@player, @level)

		if @window.button_down?(Gosu::KbReturn) && @new_press_enter
                           
        end

        if @window.button_down?(Gosu::KbLeft)
        	@player.playerx -= @player.speed                   
        end

        if @window.button_down?(Gosu::KbRight)
        	@player.playerx += @player.speed                                    
        end

        if @window.button_down?(Gosu::KbEscape) && @new_press_escape
        	self.close                   
        end

        if @window.button_down?(Gosu::KbSpace) and @new_press_space and @player.onground == true
        	@player.canjump = true
        end
        
		@enter, @up, @down, @left, @right, @space, @escape = false 	
		
		@new_press_enter = !@window.button_down?(Gosu::KbReturn)        
        @new_press_left = !@window.button_down?(Gosu::KbLeft)
        @new_press_right = !@window.button_down?(Gosu::KbRight)
        @new_press_space = !@window.button_down?(Gosu::KbSpace)
        @new_press_escape = !@window.button_down?(Gosu::KbEscape)
	end

	def draw camx, camy
		@player.draw(@window, camx, camy)
		@background.draw(@window, camx, camy)
	end
end