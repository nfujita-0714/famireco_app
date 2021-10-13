FactoryBot.define do
  factory :user01, class: User do
    name { 'user01' }
    email { 'user01@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :user02 class: User do
    name { 'user02' }
    email { 'user02@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :admin, class: User do
    name { 'admin' }
    email { 'admin@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { true }
  end
end