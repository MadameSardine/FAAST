require './lib/station'

describe Station do

	let(:station) {Station.new}
	let(:train) {double :train}
	let(:user) {double :user}
	
	it "has no train" do
		expect(station.train_count).to eq(0)
	end

	it "can allow a train in" do
		expect{station.allow_in(train)}.to change{station.train_count}.by 1
	end

	it "can allow a train to stop in the station" do
		expect(train).to receive(:stop)
		station.allow_stop(train)
	end

	it " can allow a train to leave the station" do
		expect(train).to receive(:travel)
		station.allow_leave(train)
	end

end