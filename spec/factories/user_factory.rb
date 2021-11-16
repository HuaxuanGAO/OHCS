FactoryBot.define do
    factory :user do
      role {'patient'}
      email {'patient@gmail.com'}
      username {'patient1'}
      last_name {'Juc'}
      first_name {'Lu'}
      gender {'Female'}
      birthday {"10-12-1996"}
      password {'randompass'}
      password_confirmation {'randompass'}
    end
end