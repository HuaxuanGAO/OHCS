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
        login_doctor
    
        context "from login user" do
          it "should return 200:OK" do
            get :index
            expect(response).to have_http_status(:success)
          end
        end
      end

end