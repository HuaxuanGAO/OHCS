require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'
require_relative "../support/devise"

RSpec.describe "Slot", type: :request do

  describe 'Get /slots', type: :request do 
    it 'check slots info' do
      get "/slots"
      expect(response).to have_http_status(:success)
    end
  end

end
