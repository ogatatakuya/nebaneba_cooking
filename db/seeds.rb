# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@admin',
  password: 'testtest'
)

Member.create!(
  name: 'あああ',
  email: 'admin@admin',
  password: 'testtest'
)

Tag.create!([
  {name: '和風'},
  {name: '洋風'}
])

Cooking.create!([
  {
    member_id: 1,
    tag_id: 1,
     
    name: 'とろろそば',
    introduction: 'とろろ'
  },
  {
    member_id: 1,
    tag_id: 2,
    name: '納豆パスタ',
    introduction: '納豆'
  }
])

Tagmap.create!([
  {
  tag_id: 1,
  cooking_id: 1
  },
  {
  tag_id: 2,
  cooking_id: 2
  }
])

