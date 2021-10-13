FactoryBot.define do
  factory :user
    name { 'user1' }
    email { 'user01@example.com' }
    password { 'password' }
    password_confirmation { 'password' }

  factory :user2, class: User do
    name { 'user2' }
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