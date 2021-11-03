require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

FactoryBot.define do
    factory :patient do
      email {'ljcjsl@gmail.com'}
      username {'ljcjsl520'}
      last_name {'Juc'}
      first_name {'Lu'}
      gender {'Female'}
      birthday {"10-12-1996"}
      password {'randompass'}
      password_confirmation {'randompass'}
    end
end