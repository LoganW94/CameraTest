require 'Gosu'
require_relative 'collision'
require_relative 'player'
require_relative 'background'

class Handler 
	attr_accessor :player

	def initialize background, player, window, width, height
		@background = background
		@player = player
		@window = window
		@tilesize = 32

		@collision_detect = Collision.new(@tilesize)
        @player = Player.new(width, height, @tilesize)
        @background = Background.new(@tilesize, width)

		@new_press_return,  
        @new_press_left, 
        @new_press_right, 
        @new_press_space, 
        @new_press_escape,
        @canjump,
        @onground = false

        @level = @background.level
	end

	def update
		@player.update
		@onground = @collision_detect.collide(@player, @level)

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

        if @window.button_down?(Gosu::KbSpace) and @new_press_space and @onground == true
        	@canjump = true
        end
        # move to player class
        if @canjump == true and @player.jumpframes < @player.maxjframes
        	@player.jump
        	@player.jumpframes += 1
        elsif @player.jumpframes >= @player.maxjframes
        	@player.jumpframes = 0
        	@canjump = false
        	@onground = false
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