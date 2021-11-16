require 'rails_helper'
require_relative "../support/devise"
require 'simplecov'
SimpleCov.start 'rails'

RSpec.describe User, :type => :model do
  it "get avartar" do
    FactoryBot.create(:user)
    expect(User.find(1).gravatar_url).to eq("https://gravatar.com/avatar/663109d2bc9b10bec465f3642953868a.png")
  end
end