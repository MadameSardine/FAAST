require './lib/user_container.rb'
require './lib/user.rb'

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

	it "should not allow an user to enter if user is already inside" do
		space.let_enter(user)
		expect{space.let_enter(user)}.to raise_error"The user is already inside"
	end

	it "can let users exit" do
		space.let_enter(user)
		expect{space.let_exit(user)}.to change{space.user_count}.by -1
	end

	it "should not allow an user to exit if not inside" do
		expect{space.let_exit(user)}.to raise_error "The user is already outside"
	end

	it "should know when it's full" do
		fill(space)
		expect(space).to be_full
	end

	it "should not allow a new user when it's full" do
		fill(space)
		expect{space.let_enter(user)}.to raise_error "This space is full, no more user is allowed"
	end

	def fill(space)
		space.capacity.times {space.let_enter(User.new)}
	end

end