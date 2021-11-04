require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

RSpec.describe "Doctors", type: :request do

  # sign in related
  describe "GET /doctors/sign_in" do    
    it "get doctor sign in" do
      get "/doctors/sign_in"
      expect(response).to render_template("devise/sessions/new")
    end
  end

  describe 'POST /doctors/sign_in', type: :request do 
    it 'post doctor sign in form' do
      post "/doctors/sign_in"
      expect(response).to render_template("devise/sessions/new")
    end
  end

  describe 'DELETE /doctors/sign_out', type: :request do 
    it 'let doctor sign out' do
      delete "/doctors/sign_out"
      expect(response).to redirect_to("/")
    end
  end

  describe 'GET /doctors/password/new', type: :request do 
    it 'get doctor password' do
      get "/doctors/password/new"
      expect(response).to render_template("devise/passwords/new")
    end
  end

  describe 'GET /doctors/password/edit', type: :request do 
    it 'edit doctor password' do
      get "/doctors/password/edit"
      expect(response).to redirect_to("/doctors/sign_in")
    end
  end

  describe 'PUT /doctors/password', type: :request do 
    it 'update doctor password' do
      put "/doctors/password"
      expect(response).to render_template("devise/passwords/edit")
    end
  end

  describe 'POST /doctors/password', type: :request do 
    it 'create doctor password' do
      post "/doctors/password"
      expect(response).to render_template("devise/passwords/new")
    end
  end

  # registration related
  describe 'Get /doctors/sign_up', type: :request do 
    it 'creates a new doctor' do
      get "/doctors/sign_up"
      expect(response).to render_template("devise/registrations/new")
    end
  end

  describe 'Get /doctors/edit', type: :request do 
    it 'edit new doctor essential info' do
      get "/doctors/edit"
      expect(response).to redirect_to("/doctors/sign_in")
    end
  end

end