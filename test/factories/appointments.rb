FactoryBot.define do
  factory :appointment do
    name { "MyString" }
    start_time { "2021-11-17 11:15:23" }
    end_time { "2021-11-17 11:15:23" }
    patient { nil }
    doctor { nil }
  end
end
