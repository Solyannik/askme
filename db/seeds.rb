User.create!(
  name: 'Ольга',
  username: 'solya',
  email: 'solyannik@mail.ru',
  password: '123123'
)

5.times do
  user = User.create!(
    name: FFaker::Name.unique.name,
    username: FFaker::Internet.unique.domain_word,
    email: FFaker::Internet.unique.free_email,
    avatar_url: FFaker::Avatar.unique.image,
    password: '123123'
  )

  user.questions.create!(
    text: FFaker::Lorem.phrase
  )
end
