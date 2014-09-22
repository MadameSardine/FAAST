require './lib/user.rb'
require './lib/station.rb'

describe User do 

	let(:user) {User.new}
	let(:station) {Station.new}
	let(:coach) {Coach.new}
	let(:train) {Train.new}

	it "is not in a station" do
		expect(user).not_to be_in_station
	end

	it "can touch in to enter a station" do
		user.touch_in(station)
		expect(user).to be_in_station
	end

	it "can touch out to exit a station" do
		user.touch_in(station)
		user.touch_out(station)
		expect(user).not_to be_in_station
	end

	it "is not in a train" do
		expect(user).not_to be_in_train
	end

	it "is not in a train coach" do
		expect(user).not_to be_in_coach
	end

	it "can board a train coach from a station" do
		user.touch_in(station)
		user.board_coach(station, coach)
		expect(user).not_to be_in_station
		expect(user).to be_in_coach
	end

	it "can alight at a station from a coach" do
		user.touch_in(station)
		user.board_coach(station, coach)
		user.alight_station(coach, station)
		expect(user).not_to be_in_coach
		expect(user).to be_in_station
	end

	it "should be allowed to enter a station after touching in" do
		expect(station).to receive(:let_enter).with(user)
		user.touch_in(station)
	end

	it "should be allowed to exit a station after touching out" do
		expect(station).to receive(:let_exit).with(user)
		user.touch_out(station)
	end

	it "can enter a coach from a station if not full" do
		expect(coach).to receive(:let_enter).with(user)
		expect(station).to receive(:let_exit).with(user)
		user.board_coach(station, coach)
	end

	it "can alight at a station from a coach" do
		expect(coach).to receive(:let_exit).with(user)
		expect(station).to receive(:let_enter).with(user)
		user.alight_station(coach, station)
	end

end
