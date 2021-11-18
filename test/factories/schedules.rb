FactoryBot.define do
  factory :schedule do
    doc_id { 1 }
    start_time { "2021-11-17 13:09:13" }
    end_time { "2021-11-17 13:09:13" }
    doctor { nil }
  end
end
