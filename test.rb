require 'Gosu'
require_relative 'camera'
require_relative 'player'
require_relative 'background'
require_relative 'collision'
require_relative 'handler'

class Window < Gosu::Window

	def initialize width = 800, height = 600, fullscreen = false
		super
		
		self.caption = "camera test"

		@tilesize = 32
        @new_press_return,  
        @new_press_left, 
        @new_press_right, 
        @new_press_space, 
        @new_press_escape,
        @canjump = false

		@background = Background.new(@tilesize)
		@cam = Camera.new(0,0,width,height)
		@player = Player.new(width, height, @tilesize)
		@collision_detect = Collision.new 
		@handler = Handler.new(@background, @player)
		@onground = false
		@level = @background.level
		
	end

	def update
		@onground = @collision_detect.collide(@player, @level)
		@player.update
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

        if button_down?(Gosu::KbSpace) and @new_press_space and @onground == true
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