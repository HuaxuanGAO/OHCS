require 'rails_helper'
require_relative "../support/devise"
require 'simplecov'
SimpleCov.start 'rails'

if RUBY_VERSION>='2.6.0'
  if Rails.version < '5'
    class ActionController::TestResponse < ActionDispatch::TestResponse
      def recycle!
        # hack to avoid MonitorMixin double-initialize error:
        @mon_mutex_owner_object_id = nil
        @mon_mutex = nil
        initialize
      end
    end
  else
    puts "Monkeypatch for ActionController::TestResponse no longer needed"
  end
end

describe DoctorsController, type: :controller do

    describe "GET /" do
      let!(:doctor) { login_doctor}
    
        context "from login user" do
          it "should return 200:OK" do
            get :index
            expect(response).to have_http_status(:success)
          end
        end
        # Doctor.destroy(doctor.id)
    end

    describe 'GET /doctors/:id/profile' do
      let!(:doctor) { login_doctor}
      it 'shows doctor profile' do
        get "/doctors/:id/profile", id: doctor.id
        expect(response).to render_template("/doctors/:id/profile")
      end
      # Doctor.destroy(doctor.id)
    end

end