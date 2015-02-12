# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

heroku = Topic.create!(name: 'Heroku')
rails = Topic.create!(name: 'Rails')
rest = Topic.create!(name: 'REST')
bootstrap = Topic.create!(name: 'Bootstrap')

link_1 = heroku.resources.create!(name: 'Deploying To Heroku', url: 'http://docs.railsbridge.org/intro-to-rails/deploying_to_heroku')
link_2 = heroku.resources.create!(name: 'Getting Started With Rails', url: 'https://devcenter.heroku.com/articles/getting-started-with-rails4')

link_1.comments.create!(message: 'go-to link')
link_2.comments.create!(message: 'super helpful')
