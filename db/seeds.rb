# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Game.create(name: "Hearthstone", short_name: "hs")
Game.create(name: "Heroes of the Storm", short_name: "hots")
Game.create(name: "Dota 2", short_name: "dota2")