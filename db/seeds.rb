# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

users = JSON.parse(File.read(File.expand_path('../users.json', __FILE__)))
posts = JSON.parse(File.read(File.expand_path('../posts.json', __FILE__)))
comments = JSON.parse(File.read(File.expand_path('../comments.json', __FILE__)))

User.create(users)
Post.create(posts)
Comment.create(comments)
