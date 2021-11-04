require 'rails_helper'
require_relative "../support/devise"
require 'simplecov'
SimpleCov.start 'rails'

RSpec.describe Doctor, :type => :model do
  it "get avartar" do
    FactoryBot.create(:doctor)
    expect(Doctor.find(1).gravatar_url).to eq("https://gravatar.com/avatar/2cbc51eb60f8ebb989cfc992895bc6f4.png")
  end
end