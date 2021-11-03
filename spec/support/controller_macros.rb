module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryBot.create(:admin) # Using factory bot as an example
    end
  end

  def login_doctor
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:doctor]
      doctor = FactoryBot.create(:doctor)
      sign_in doctor
    end
  end

  def login_patient
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:patient]
      patient = FactoryBot.create(:patient)
      sign_in patient
    end
  end
end
