require 'chingu'

class Game < Chingu::Window

	#Constructor
	def initialize
		super
		self.input = {esc: :exit}
		@player = Player.create
	end	
end	

class Player < Chingu::GameObject

	#meta.contructor
	def setup
		@x, @y, = 350, 400
		@image = Gosu::Image["alienblaster.png"]

	end

end

Game.new.show
