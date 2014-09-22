require './lib/user_container.rb'

class PassengerHolder; include UserContainer; end

describe PassengerHolder do

	let(:space) {PassengerHolder.new}
	let(:station) {double :station}
	let(:coach) {double :coach}
	let(:user) {double :user}

	it "has no users at opening" do
		expect(space.user_count).to eq(0)
	end

	it "can let users enter" do
		expect{space.let_enter(user)}.to change{space.user_count}.by 1
	end

	it "can let users exit" do
		space.let_enter(user)
		expect{space.let_exit(user)}.to change{space.user_count}.by -1
	end

	it "should know when it's full" do
		fill(space)
		expect(space).to be_full
	end

	it "should not allow a new user when it's full" do
		fill(space)
		expect{space.let_enter(user)}.to raise_error(RuntimeError)
	end

	def fill(space)
		space.capacity.times {space.let_enter(user)}
	end

end