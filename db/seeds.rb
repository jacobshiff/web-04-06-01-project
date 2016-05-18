# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
doge = Meme.create(file_name: 'doge.jpg')
pepe = Meme.create(file_name: 'pepe.jpg')
y_u_no = Meme.create(file_name: 'myfile.jpg')
beef = Meme.create(file_name: 'beef.jpg')

jacob = User.create(username: 'jacobshiff', email: 'jacob@flatiron.com')
chris = User.create(username: 'xristo', email: 'chris@meme.com')
rachel = User.create(username: 'rachelb', email: 'rachel@butts.com')

doge.creator = jacob
pepe.creator = rachel
y_u_no.creator = chris
beef.creator = chris

doge.save
pepe.save
y_u_no.save
beef.save

flatiron = Group.create(title: "Flatiron School")
google = Group.create(title: "Google")
delta_nu = Group.create(title: "Delta Nu Sorority")
my_friends = Group.create(title: "Friends")

flatiron.group_creator = chris
flatiron.save
google.group_creator = jacob
google.save
delta_nu.group_creator = rachel
delta_nu.save
my_friends.group_creator = rachel
my_friends.save
