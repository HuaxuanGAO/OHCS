require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

RSpec.describe "User", type: :request do

  # sign in related
  describe "GET /users/sign_in" do    
    it "get user sign in" do
      get "/users/sign_in"
      expect(response).to render_template("devise/sessions/new")
    end
  end

  describe 'POST /users/sign_in', type: :request do 
    it 'post user sign in form' do
      post "/users/sign_in"
      expect(response).to render_template("devise/sessions/new")
    end
  end

  describe 'DELETE /users/sign_out', type: :request do 
    it 'let user sign out' do
      delete "/users/sign_out"
      expect(response).to redirect_to("/")
    end
  end

  describe 'GET /users/password/new', type: :request do 
    it 'get user password' do
      get "/users/password/new"
      expect(response).to render_template("devise/passwords/new")
    end
  end

  describe 'GET /users/password/edit', type: :request do 
    it 'edit user password' do
      get "/users/password/edit"
      expect(response).to redirect_to("/users/sign_in")
    end
  end

  describe 'PUT /users/password', type: :request do 
    it 'update user password' do
      put "/users/password"
      expect(response).to render_template("devise/passwords/edit")
    end
  end

  describe 'POST /users/password', type: :request do 
    it 'create user password' do
      post "/users/password"
      expect(response).to render_template("devise/passwords/new")
    end
  end

  # registration related
  describe 'Get /users/sign_up', type: :request do 
    it 'creates a new user' do
      get "/users/sign_up"
      expect(response).to render_template("devise/registrations/new")
    end
  end

  describe 'Get /users/edit', type: :request do 
    it 'edit new user essential info' do
      get "/users/edit"
      expect(response).to redirect_to("/users/sign_in")
    end
  end

end
