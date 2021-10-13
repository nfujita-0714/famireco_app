#ラベル
Label.create!(
  name: "乳児期"
)
Label.create!(
  name: "幼児期"
)
Label.create!(
  name: "小学生"
)
Label.create!(
  name: "中学生"
)
Label.create!(
  name: "高校生"
)
Label.create!(
  name: "春陽"
)
Label.create!(
  name: "心美"
)

#user
10.times do |n|
  user = User.create!(
    name: "user#{n}",
    email: "user#{n}@example.com",
    self_introduction: "よろしくお願いします！",
    password: "password",
    password_confirmation: "password",
  )
end

User.create!(
  name: "admin_user",
  email: "admin_user@example.com",
  self_introduction: "管理者です。よろしくお願いいたします。",
  admin: "true",
  password: "password",
  password_confirmation: "password",
)


10.times do |n|
  Picture.create!(
    image: Rails.root.join("db/images/picture_#{n+1}.png").open,
    content: "元気です！",
    user_id: "#{n + 1}"
  )
end

5.times do |n|
  Labeling.create!(
    picture_id: "#{n + 1}",
    label_id: "#{n + 1}"
  )
end

5.times do |n|
  Favorite.create!(
    picture_id: "#{n + 1}",
    user_id: "#{n + 1}"
  )
end
