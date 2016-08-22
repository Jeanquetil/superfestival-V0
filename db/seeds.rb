# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Festival.destroy_all

Festival.create!(name: "Lollapaloozade", start_date: Date.new(2016,9,10) , end_date: Date.new(2016,9,11) , location: "Berlin", photo: "http://lolp3.de.c3cdn.com/wp/wp-content/uploads/2014/11/LOL2014-DE-footer_v2.png")

Artist.create!(name: "Joseph Salvat", genre: "Pop" )
Artist.create!(name: "Dubioza Kollektiv", genre: "Reggae")
Artist.create!(name: "Lindsey Stirling", genre: "Pop")
Artist.create!(name: "Graham Candy", genre: "Indie")
Artist.create!(name: "Junge Junge", genre: "Pop")
Artist.create!(name: "Matoma", genre: "House")
Artist.create!(name: "Pelemele", genre: "Pop")
Artist.create!(name: "Catfish and the Bottlemen", genre: "Alternative Rock")
Artist.create!(name: "Jess Glynne", genre: "Electro" )
Artist.create!(name: "Jagwar Ma", genre: "Dance")
Artist.create!(name: "Alan Walker", genre: "House" )
Artist.create!(name: "Tocotronic", genre: "Rock" )
Artist.create!(name: "Kaiser Chiefs", genre: "Rock")
Artist.create!(name: "Destructo", genre: "Electo" )
Artist.create!(name: "Ritter Rost Band", genre: "Pop")
Artist.create!(name: "Max Herre & Kahedi Radio Orchestra", genre: "Hip Hop")
Artist.create!(name: "Odeza", genre: "Electro" )
Artist.create!(name: "Klingande", genre: "Deep House")
Artist.create!(name: "Philipp Poisel", genre: "Pop")
Artist.create!(name: "Chainsmokers", genre: "Electro")
Artist.create!(name: "Paul Kalkbrenner", genre: "Techno")
Artist.create!(name: "G-Eazy", genre: "Hip Hop")
Artist.create!(name: "Chase & Status DJ set & Rage", genre: "Drum and Bass")
Artist.create!(name: "Kings of Leon", genre: "Rock")
Artist.create!(name: "New Order", genre: "Dance")
Artist.create!(name: "Dimitri Vegas & Like Mike", genre: "Electro")

Concert.create!(start_time: DateTime.new(2016,9,10,12,00), end_time: (2016,9,10,12,45), stage: "Main Stage 2", festival_id: 1, artist_id: 1)
Concert.create!(start_time: DateTime.new(2016,9,12,45), end_time: (2016,9,10,13,30), stage: "Main Stage 1", festival_id: 1, artist_id: 2)
Concert.create!(start_time: DateTime.new(2016,9,10,13,30), end_time: (2016,9,10,14,30), stage: "Main Stage 2", festival_id: 1, artist_id: 3)
Concert.create!(start_time: DateTime.new(2016,9,10,13,30), end_time: (2016,9,10,14,30), stage: "Alternative Stage", festival_id: 1, artist_id: 4)
Concert.create!(start_time: DateTime.new(2016,9,10,11,30), end_time: (2016,9,10,13,45), stage: "Perry's Stage", festival_id: 1, artist_id: 5)
Concert.create!(start_time: DateTime.new(2016,9,10,14,00), end_time: (2016,9,10,15,00), stage: "Perry's Stage", festival_id: 1, artist_id: 6)
Concert.create!(start_time: DateTime.new(2016,9,10,14,00), end_time: (2016,9,10,14,45), stage: "Kidzapalooza", festival_id: 1, artist_id: 7)
Concert.create!(start_time: DateTime.new(2016,9,10,14,30), end_time: (2016,9,10,15,30), stage: "Main Stage 1", festival_id: 1, artist_id: 8)
Concert.create!(start_time: DateTime.new(2016,9,10,15,30), end_time: (2016,9,10,16,30), stage: "Main Stage 2", festival_id: 1, artist_id: 9)
Concert.create!(start_time: DateTime.new(2016,9,10,15,00), end_time: (2016,9,10,16,00), stage: "Alternative Stage", festival_id: 1, artist_id: 10)
Concert.create!(start_time: DateTime.new(2016,9,10,15,30), end_time: (2016,9,10,16,00), stage: "Perry's Stage", festival_id: 1, artist_id: 11)
Concert.create!(start_time: DateTime.new(2016,9,10,16,30), end_time: (2016,9,10,17,30), stage: "Main Stage 1", festival_id: 1, artist_id: 12)
Concert.create!(start_time: DateTime.new(2016,9,10,16,30), end_time: (2016,9,10,17,30), stage: "Alternative Stage", festival_id: 1, artist_id: 13)
Concert.create!(start_time: DateTime.new(2016,9,10,16,15), end_time: (2016,9,10,17,15), stage: "Perry's Stage", festival_id: 1, artist_id: 14)
Concert.create!(start_time: DateTime.new(2016,9,10,16,30), end_time: (2016,9,10,17,15), stage: "Kidzapalooza", festival_id: 1, artist_id: 14)
Concert.create!(start_time: DateTime.new(2016,9,10,17,30), end_time: (2016,9,10,18,30), stage: "Main Stage 2", festival_id: 1, artist_id: 14)
Concert.create!(start_time: DateTime.new(2016,9,10,18,00), end_time: (2016,9,10,19,00), stage: "Alternative Stage", festival_id: 1, artist_id: 14)
Concert.create!(start_time: DateTime.new(2016,9,10,17,30), end_time: (2016,9,10,18,30), stage: "Perry's Stage", festival_id: 1, artist_id: 14)
Concert.create!(start_time: DateTime.new(2016,9,10,18,30), end_time: (2016,9,10,19,30), stage: "Main Stage 1", festival_id: 1, artist_id: 14)
Concert.create!(start_time: DateTime.new(2016,9,10,18,45), end_time: (2016,9,10,20,00), stage: "Perry's Stage", festival_id: 1, artist_id: 14)
Concert.create!(start_time: DateTime.new(2016,9,10,19,30), end_time: (2016,9,10,21,00), stage: "Main Stage 2", festival_id: 1, artist_id: 14)
Concert.create!(start_time: DateTime.new(2016,9,10,19,30), end_time: (2016,9,10,20,45), stage: "Alternative Stage", festival_id: 1, artist_id: 14)
Concert.create!(start_time: DateTime.new(2016,9,10,20,15), end_time: (2016,9,10,21,30), stage: "Perry's Stage", festival_id: 1, artist_id: 14)
Concert.create!(start_time: DateTime.new(2016,9,10,21,00), end_time: (2016,9,10,22,30), stage: "Main Stage 1", festival_id: 1, artist_id: 14)
Concert.create!(start_time: DateTime.new(2016,9,10,21,00), end_time: (2016,9,10,22,0), stage: "Alternative Stage", festival_id: 1, artist_id: 14)
Concert.create!(start_time: DateTime.new(2016,9,10,21,45), end_time: (2016,9,10,22,45), stage: "Perry's Stage", festival_id: 1, artist_id: 14)


# Artist.create!(name: , genre: )
# Artist.create!(name: , genre: )
# Artist.create!(name: , genre: )
# Artist.create!(name: , genre: )


Festival.create!(name: "Fête de l'Huma", start_date: Date.new(2016,9,9) , end_date: Date.new(2016,9,11) , location: "La Courneuve", photo: "http://adecr44.fr/sites/default/files/fichiers/www/images/Fete-de-lhuma-bandeau-960x450.png")
Festival.create!(name: "Roscella Bay", start_date: Date.new(2016,9,23), end_date: Date.new(2016,9,25), location: "La Rochelle" , photo: "http://www.roscellabay.fr/img/logo_video_fb-2-1.gif")

# Concert.create!(start_time: , end_time: , stage: , festival_id: 1, artist_id: , )


