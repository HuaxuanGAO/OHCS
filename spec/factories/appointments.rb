FactoryBot.define do
  factory :appointment do
    name { "MyString" }
    start_time { "2021-11-17 11:15:23" }
    end_time { "2021-11-17 11:15:23" }
    before(:create) do |appointment|
      appointment.patient = create(:user, role:'patient').patient
      appointment.doctor = create(:user, role:'doctor').doctor
    end
  end
end
