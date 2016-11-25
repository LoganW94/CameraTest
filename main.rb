require 'Gosu'
require_relative 'camera'
require_relative 'handler'

class Window < Gosu::Window

	def initialize width = 800, height = 600, fullscreen = false
	    super
	    self.caption = "camera test"

	    @cam = Camera.new(0,0,width, height)
	    @handler = Handler.new(self, width, height)
	end

	def update
        @handler.update
        @cam.update(@handler.player)
	end

	def draw
		@cam.draw(@handler)
	end
end

Window.new.show