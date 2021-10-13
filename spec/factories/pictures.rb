FactoryBot.define do
  factory :picture01, class: Picture do
    content { 'picture01' }
    user { nil }
  end

  factory :picture02, class: Picture do
    content { 'picture02' }
    user { nil }
  end

  factory :picture03, class: Picture do
    content { 'picture03' }
    user { nil }
  end
end