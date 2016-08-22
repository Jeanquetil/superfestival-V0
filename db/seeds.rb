# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Festival.destroy_all

Festival.create!(name: "Lollapaloozade", start_date: Date.new(2016,9,10) , end_date: Date.new(2016,9,11) , location: "Berlin", photo: "http://lolp3.de.c3cdn.com/wp/wp-content/uploads/2014/11/LOL2014-DE-footer_v2.png")
Festival.create!(name: "Fête de l'Huma", start_date: Date.new(2016,9,9) , end_date: Date.new(2016,9,11) , location: "La Courneuve", photo: "http://adecr44.fr/sites/default/files/fichiers/www/images/Fete-de-lhuma-bandeau-960x450.png")
Festival.create!(name: "Roscella Bay", start_date: Date.new(2016,9,23), end_date: Date.new(2016,9,25), location: "La Rochelle" , photo: "http://www.roscellabay.fr/img/logo_video_fb-2-1.gif")

Concert.new
