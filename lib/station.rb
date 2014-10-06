require_relative 'user_container'

class Station

	include UserContainer

	attr_reader :trains

	def initialize
		@trains = []
	end

	def train_count
		trains.count
	end

	def allow_stop(train)
		raise "The train is already stopped at the station" if trains.include?(train)
		train.stop
		trains << train
	end

	def allow_leave(train)
		raise "The train can't exit because it is not in the station" unless trains.include?(train)
		train.travel
		trains.delete(train)
	end

end