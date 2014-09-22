class User

	def initialize(station=false, train=false, coach=false)
		@station = station
		@train = train
		@coach = coach
	end

	def in_station?
		@station
	end

	def touch_in(station)
		station.let_enter(self)
		@station = station
	end

	def touch_out(station)
		station.let_exit(self)
		@station = false
	end

	def in_coach?
		@coach
	end

	def in_train?
		@train
	end

	def board_coach(station, coach)
		station.let_exit(self)
		coach.let_enter(self)
		@station = false
		@coach = coach
	end

	def alight_station(coach, station)
		coach.let_exit(self)
		station.let_enter(self)
		@station = station
		@coach = false
	end


end