FactoryGirl.define do
  sequence :uid do |n|
    "%09d" % n
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    uid
    email
    name 'Flavia'
    access_token '12345#@!'
    provider 'facebook'
  end
end
