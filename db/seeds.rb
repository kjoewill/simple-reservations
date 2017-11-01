# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

gliders = Schedule.managed_gliders
date = Date.parse('15/09/2017')

Schedule.create!([
  {
    day:date,
    glider:gliders[0],
    s0800:"Kevin",
    s0830:"Kevin",
    s0900:"Kevin",
    s1600:"Kevin",
    s1630:"Kevin"
  },
  {
    day:date,
    glider:gliders[1],
    s0900:"Tanya",
    s0930:"Tanya",
    s1000:"Tanya",
    s1530:"Tanya",
    s1600:"Tanya"
  },
  {
    day:date,
    glider:gliders[2],
    s1000:"K2",
    s1030:"K2",
    s1100:"K2",
    s1500:"K2",
    s1530:"K2"
 },
    {
    day:date,
    glider:gliders[3],
    s1100:"Zamb",
    s1130:"Zamb",
    s1200:"Zamb",
    s1430:"Zamb",
    s1500:"Zamb"
  },
    {
    day:date,
    glider:gliders[4],
    s1200:"Raptor",
    s1230:"Raptor",
    s1230:"Raptor",
    s1400:"Raptor",
    s1430:"Raptor"
  }
])

