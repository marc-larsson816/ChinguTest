require 'chingu'

class Game < Chingu::Window

	#Constructor
	def initialize
		super 1366, 768
		self.caption = "Vedyo Gaem"
		self.input = {esc: :exit}
		@player = Player.create
	end	
end	

class Player < Chingu::GameObject

	#meta.contructor
	def setup
		@x, @y, @x_vel, @y_vel, @angle = 350, 400, 0, 0, 0
		@image = Gosu::Image["alienblaster.png"]
		self.input = {
			holding_left: :left,
			holding_right: :right,
			holding_up: :accelerate,
			holding_down: :deccelerate,
			q: :center
		}
	
	end
		def center
			@x = 400
			@y = 320
		end

		def left
			@angle -= 7
		end

		def right
			@angle += 7
		end

		def accelerate
			@x_vel += Gosu::offset_x(@angle, 0.5)
			@y_vel += Gosu::offset_y(@angle, 0.5)
			@image = Gosu::Image['alienblasterthrust.png']

		end

		def deccelerate
			@x_vel -= Gosu::offset_x(@angle, 0.5)
			@y_vel -= Gosu::offset_y(@angle, 0.5)
		end

		def thrust
			@x += @x_vel
			@y += @y_vel
			@x_vel *= 0.97
			@y_vel *= 0.97
			@x %= 1366
			@y %= 768
		end

		def update
			super 
			thrust
		end
end

Game.new.show
