require './lib/train.rb'

describe  Train do

let(:train) {Train.new }
let(:station) {double :station, train_count: true}
let(:coach) {double :coach}
let(:user) {double :user}

	it "has five coaches" do
		expect(train.coach_count).to eq(5)
	end

	it "should be at a station" do
		expect(train).to be_at_station
	end

	it "can travel between stations" do
		train.travel
		expect(train).not_to be_at_station
	end

	it "can stop at a station" do
		train.travel
		train.stop
		expect(train).to be_at_station
	end

	it "should be allowed to enter and stop at a station" do
		expect(station).to receive(:allow_stop).with(train)
		train.enter(station)
	end

	it "should know the station it is in" do
		allow(station).to receive(:allow_stop).with(train)
		train.enter(station)
		expect(train.position).to eq(station)
	end

	it "should know when it is in transit between station" do
		train.exit(station)
		expect(train.position).to eq("In transit")
	end

	it "can travel from a station to another" do
		next_station = double :station
		allow(next_station).to receive(:allow_stop).with(train)
		train.transit(station, next_station)
		expect(train.position).to eq(next_station)
	end

	it "has no passenger" do
		expect(train.user_count).to eq(0)
	end

	it "should load user only if stopped" do
		train.travel
		expect{train.let_enter(user)}.to raise_error(RuntimeError)
	end

	it "should unload user only if stopped" do
		train.travel
		expect{train.let_exit(user)}.to raise_error(RuntimeError)
	end

end
