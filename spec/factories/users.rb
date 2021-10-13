FactoryBot.define do
  factory :admin_user, class: User do
    name {'admin_name'}
    email {'admin_email@gmail.com'}
    password {'password'}
    password_confirmation {'password'}
    admin {true}
  end
  factory :basic_user, class: User do
    name {'basic_name'}
    email {'basic_email@gmail.com'}
    password {'password'}
    password_confirmation {'password'}
    admin {false}
  end
    factory :basic2_user, class: User do
    name {'basic2_name'}
    email {'basic2_email@gmail.com'}
    password {'password'}
    password_confirmation {'password'}
    admin {false}
  end
end