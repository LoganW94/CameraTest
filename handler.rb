require 'Gosu'
require_relative 'collision'
require_relative 'player'
require_relative 'background'

class Handler 
	attr_accessor :player

	def initialize window, width, height
        	@window = window
        	@tile_size = 32

        	@collision_detect = Collision.new(@tile_size)
                @player = Player.new(width, height, @tile_size)
                @background = Background.new(@tile_size, width)
  
                @new_press_left, 
                @new_press_right, 
                @new_press_space, 
                @new_press_escape = false

                @level = @background.level
	end

	def update
        	
        	@collision_detect.tile_collide(@player, @level)
                @player.update

                if @window.button_down?(Gosu::KbLeft) and @player.can_move_left == true
                	@player.playerx -= @player.speed                   
                end

                if @window.button_down?(Gosu::KbRight) and @player.can_move_right == true
                	@player.playerx += @player.speed                                    
                end

                if @window.button_down?(Gosu::KbEscape) && @new_press_escape
                	@window.close                   
                end

                if @window.button_down?(Gosu::KbSpace) and @new_press_space and @player.onground == true
                	@player.canjump = true
                end
                
                @left, @right, @space, @escape = false 	
        		        
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