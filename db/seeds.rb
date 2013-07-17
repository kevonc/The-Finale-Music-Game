# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

genre_array = ["R&B", "Electronic", "Avant-Garde", "Latin", "Pop", "Jazz", "Folk", "Country", "Religious", "International",
               "New Age","Heavy Metal", "Soul", "Gothic", "Disco", "Freestyle", "Opera", "Hip-hop", "Rap", "Trap", "Ambient",
               "Dubstep", "Ballads", "Trance", "Classical", "A Capella", "Funk", "Hardcore", "Progressive House", "Blues",
               "Instrumental Rock", "Drum & Bass", "Ballads", "Abstract", "Alternative", "Contemporary", "Indie", "Reggae",
               "Techno", "Breakbeats"]

genre_array.each do |genre|
  new_genre = Genre.create(kind: genre)
end