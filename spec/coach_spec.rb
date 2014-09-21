require './lib/coach.rb'

describe Coach do

	let(:coach) { Coach.new}

	it "should be full when it has 40 users" do
		40.times { coach.let_enter(User.new) }
		expect(coach).to be_full
	end

	it "should be attached to a train" do
		expect(coach).to be_attached_to_train
	end


end