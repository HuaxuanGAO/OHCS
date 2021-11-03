require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

RSpec.describe "Patients", type: :request do
  describe "GET /patients/sign_in" do    
    it "get patient sign in" do
      get "/patients/sign_in"
      expect(response).to render_template("devise/sessions/new")
    end
  end

  describe 'POST /patients/sign_up', type: :request do 
    it 'creates a new patient' do
      expect {post '/patients', :params => {patient: FactoryBot.attributes_for(:patient)}
      }.to change { Patient.count }.by(1)
    end

    it 'redirects to the movie index page' do
      post '/patients', :params => {patient: FactoryBot.attributes_for(:patient)}
      expect(response).to redirect_to("/patients/1/profile")
    end
  end
end
