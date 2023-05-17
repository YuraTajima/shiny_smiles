# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
     email: 'admin@test.com',
     password: '111111'
     )
     
Genre.create!(
  [
    {name: '歯ブラシ' },
    {name: '歯磨き粉' },
    {name: '補助的清掃用具' },
    {name: '洗口液' },
    {name: 'ホワイトニング' },
    {name: '口臭ケア' }
  ]
)

customers = Customer.create!(
  [
    {email: 'cake@example.com', name: 'けーき', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'pudding@example.com', name: 'ぷりん', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'candy@example.com', name: 'きゃんでぃー', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
    {email: 'cookie@example.com', name: 'くっきー', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")}
  ]
)

Submission.create!(
  [
    {name: 'コンクール', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), genre_id: '4', introduction: '虫歯、歯周病予防、口臭に効果的です。水に薄めて使うのでコスパがいいです。', price: '1000', customer_id: customers[0].id },
    {name: 'シュミテクト', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), genre_id: '2', introduction: '歯がしみるので購入したところ、だんだんしみなくなってきました！', price: '799', customer_id: customers[1].id },
    {name: 'システマ', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), genre_id: '1', introduction: '歯茎の中に入ってる感じがしてよく磨けます。', price:'299', customer_id: customers[2].id }
  ]
)