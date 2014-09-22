require_relative 'user_container'

class Train

	include UserContainer

	def initialize
		@coaches ||= [Coach.new, Coach.new, Coach.new, Coach.new, Coach.new]
		self.capacity = 200
		@station ||= "Depot"
		stop
	end

	def coaches
		@coaches
	end

	def at_station?
		@at_station
	end

	def travel
		@at_station = false
	end

	def stop
		@at_station = true
	end

	def enter(station)
		@station = station
		station.allow_stop(self)
	end

	def exit(station)
		@station = "In transit"
	end

	def transit(origin, destination)
		exit(origin)
		enter(destination)
	end

	def position
		@station
	end

	def coach_count
		coaches.count
	end

	def let_enter(user)
		raise "The train is not stopped, users can not enter" if !at_station?
		raise "This space is full, no more user is allowed" if full?
		users << user
	end

	def let_exit(user)
		raise "The train is not stopped, users can not exit" if !at_station?
		users.delete(user)
	end

end