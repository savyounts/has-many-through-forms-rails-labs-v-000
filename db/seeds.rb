# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
s = Category.create(name: "scary")
c = Category.create(name: "cool")
f = Category.create(name: "funny")
sad = Category.create(name: "sad")
h = Category.create(name: "happy")

c1 = Comment.create(content: "I'm a comment")
c2 = Comment.create(content: "I'm also a comment")
c3 = Comment.create(content: "I'm still a comment")
c4 = Comment.create(content: "I'm will always be a comment")

p1 = Post.create(title: "post name", content: "contentsssss")
p2 = Post.create(title: "post 2 name", content: "more contentsssss")
p3 = Post.create(title: "post 3name", content: "even more contentsssss")
p4 = Post.create(title: "post 4name", content: "all the contentsssss")


bob = User.create(username: "bob", email: "bob@email")
bill = User.create(username: "bill", email: "bill@email")

p1.categories << s
p1.categories << c
p2.categories << s
p2.categories << f
p3.categories << sad
p4.categories << h
p4.categories << s
p4.categories << sad

bob.comments << c1
bob.comments << c2
bill.comments << c3
bill.comments << c4

p1.comments << c1
p1.comments << c2
p2.comments << c3
p3.comments << c4
