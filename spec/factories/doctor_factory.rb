FactoryBot.define do
    factory :doctor do
      email {'ljcjsl@gmail.com'}
      username {'ljcjsl'}
      last_name {'JC'}
      first_name {'Lu'}
      department {'Internal'}
      gender {'Male'}
      birthday {"10-12-1996"}
      password {'randompass'}
      password_confirmation {'randompass'}
    end
end