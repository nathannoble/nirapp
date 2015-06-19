# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Comment.delete_all
Post.delete_all

post = Post.create(
  {title: 'iPhone 5', text:'slightly used. in good condition.', price:12000.50}
)

Comment.create({commenter: 'Nathan', body:'This is an awesome phone', post_id:post.id})
post.comments.create(commenter: 'Judith', body:'This is also an awesome phone')

Post.create(
  {title: 'iPhone 6', text:'slightly used. in good condition.', price:12000.50}
).comments.create(commenter: 'Mike', body:'This is also an awesome phone')

ost.create(
  {title: 'iPhone 7', text:'slightly used. in good condition.', price:12000.50}
).comments.create(commenter: 'Mike', body:'This is also an awesome phone')
