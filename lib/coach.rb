require_relative 'user_container'

class Coach

	include UserContainer

	def initialize
		self.capacity = 40
	end

end