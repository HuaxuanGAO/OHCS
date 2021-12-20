FactoryBot.define do
  factory :appointment do
    name { "test" }
    start_time { "2021-12-27 11:00" }
    end_time { "2021-12-27 11:30" }
    before(:create) do |appointment|
      appointment.patient = create(:user, role:'patient').patient
      appointment.doctor = create(:user, role:'doctor').doctor
      appointment.slot_id = create(:slot).id
    end
  end
end
