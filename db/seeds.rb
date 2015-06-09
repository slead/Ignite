# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

events = Event.create!([
{
  name:'Ignite Athens',
  city:'Athens',
  country: 'Greece',
  url:'http://www.igniteathens.gr'
},
{
  name:'Ignite Barrie',
  city:'Barrie',
  country: 'Canada',
  url:'http://ignitebarrie.com/'
},
{
  name:'Ignite Sydney',
  city:'Sydney',
  country: 'Australia',
  url:'http://ignitesydney.com/'
}
])