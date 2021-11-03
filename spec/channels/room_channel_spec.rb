# require "rails_helper"

# RSpec.describe RoomChannel, :type => :channel do
#   it "successfully subscribes" do
#     Room.create(:name=> 1)
#     subscribe room: 1
#     expect(subscription).to be_confirmed
#   end
# end

# RSpec.describe RoomChannel, :type => :channel do
#     it "rejects subscription" do
#       Room.create(:name=> 1)
#       subscribe room_id: nil
#       expect(subscription).to be_rejected
#     end
#   end

# RSpec.describe ApplicationCable::Connection, :type => :channel do
#   it "unauthorized connection" do
#     expect { connect "/cable" }.to have_rejected_connection
#   end
# end

require "rails_helper"

RSpec.describe RoomChannel, type: :channel do
  before do
    # initialize connection with identifiers
    stub_connection room: 1
  end

  it "subscribes without streams when no room id" do
    subscribe
    expect(subscription).to be_rejected    
  end

  it "rejects when room id is invalid" do
    subscribe(room: -1)
    expect(subscription).to be_rejected
  end

  it "rejects when room id is unknown" do
    subscribe(room: 42)
    expect(subscription).to be_rejected    
  end

  it "subscribes " do 
    Room.create(:name=> 1)
    subscribe(room: 1)
    expect(subscription).to be_confirmed

    # or directly by model if you create streams with `stream_for`
    expect(subscription).to have_stream_for(Room.find(1))
  end
end