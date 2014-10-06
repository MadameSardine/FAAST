class User

	def initialize(station=nil, train=nil, coach=nil)
		@station = station
		@train = train
		@coach = coach
	end

	def in_station?
		!@station.nil?
	end

	def touch_in(station)
		station.let_enter(self)
		@station = station
	end

	def touch_out(station)
		station.let_exit(self)
		@station = nil	
	end

	def in_coach?
		!@coach.nil?
	end

	def in_train?
		!@train.nil? 
	end

	def board_coach(station, coach)
		raise "User must be in the station to board" if @station !=station
		exit(:station, station)
		enter(:coach, coach)
	end

	def exit(name, place)
		place.let_exit(self)
		eval("@#{name.to_s} = nil")
	end

	def enter(name, place)
		place.let_enter(self)
		eval("@#{name.to_s} = place") 
	end


	def alight_station(coach, station)
		exit(:coach, coach)
		enter(:station, station)
	end


end