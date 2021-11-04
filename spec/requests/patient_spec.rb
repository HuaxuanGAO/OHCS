require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

RSpec.describe "Patients", type: :request do

  # sign in related
  describe "GET /patients/sign_in" do    
    it "get patient sign in" do
      get "/patients/sign_in"
      expect(response).to render_template("devise/sessions/new")
    end
  end

  describe 'POST /patients/sign_in', type: :request do 
    it 'post patient sign in form' do
      post "/patients/sign_in"
      expect(response).to render_template("devise/sessions/new")
    end
  end

  describe 'DELETE /patients/sign_out', type: :request do 
    it 'let patient sign out' do
      delete "/patients/sign_out"
      expect(response).to redirect_to("/")
    end
  end

  describe 'GET /patients/password/new', type: :request do 
    it 'get patient password' do
      get "/patients/password/new"
      expect(response).to render_template("devise/passwords/new")
    end
  end

  describe 'GET /patients/password/edit', type: :request do 
    it 'edit patient password' do
      get "/patients/password/edit"
      expect(response).to redirect_to("/patients/sign_in")
    end
  end

  describe 'PUT /patients/password', type: :request do 
    it 'update patient password' do
      put "/patients/password"
      expect(response).to render_template("devise/passwords/edit")
    end
  end

  describe 'POST /patients/password', type: :request do 
    it 'create patient password' do
      post "/patients/password"
      expect(response).to render_template("devise/passwords/new")
    end
  end

  # registration related
  describe 'Get /patients/sign_up', type: :request do 
    it 'creates a new patient' do
      get "/patients/sign_up"
      expect(response).to render_template("devise/registrations/new")
    end
  end

  describe 'Get /patients/edit', type: :request do 
    it 'edit new patient essential info' do
      get "/patients/edit"
      expect(response).to redirect_to("/patients/sign_in")
    end
  end

end
