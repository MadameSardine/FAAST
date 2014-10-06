require './lib/station'

describe Station do

	let(:station) {Station.new}
	let(:train) {double :train}
	let(:user) {double :user}
	
	it "has no train" do
		expect(station.train_count).to eq(0)
	end

	it "can have a train" do
		allow(train).to receive(:stop)
		expect{station.allow_stop(train)}.to change{station.train_count}.by 1
	end

	it "can allow a train to stop in the station" do
		expect(train).to receive(:stop)
		station.allow_stop(train)
	end

	it "can't allow a train to stop if already in the station" do
		allow(train).to receive(:stop)
		station.allow_stop(train)
		expect{station.allow_stop(train)}.to raise_error "The train is already stopped at the station"
	end

	it "can allow a train to leave the station" do
		allow(train).to receive(:stop)
		station.allow_stop(train)
		expect(train).to receive(:travel)
		station.allow_leave(train)
	end

	it "can't allow a train which isn't in the station to leave" do
		allow(train).to receive(:travel)
		expect{station.allow_leave(train)}.to raise_error "The train can't exit because it is not in the station"
	end

end