# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find_or_create_by!(email: ENV['ADMIN_EMAIL']) do |user|
  user.password = ENV['ADMIN_PASSWORD']
  user.password_confirmation = ENV['ADMIN_PASSWORD']
  # user.confirm
end


puts '---', ' ', 'Seeding locations', ' '
[
    { name: 'Sonnenberg', weather_forecast: true, lng: 8.447897368060037, lat: 46.313237079597194, elevation: 2400, webcam: 'https://tuks.ch/webcam/bosco7000M.jpg'},
    { name: 'Guriner Furka', weather_forecast: false, lng: 8.453941633227059, lat: 46.32362148936983, elevation: 2320, webcam: 'https://tuks.ch/webcam/bosco6000M.jpg'},
    { name: 'Rossboda', weather_forecast: false, lng: 8.46577957067739, lat: 46.315896652863024, elevation: 2000, webcam: 'https://tuks.ch/webcam/bosco1.jpg?1416844635639'},
    { name: 'Kids Village', weather_forecast: false, lng: 8.487836065277635, lat: 46.315534542944825, elevation: 1500, webcam: 'https://tuks.ch/webcam/bosco3.jpg?1416844686748'},
    { name: 'Paese', weather_forecast: false, lng: 8.49345797523924, lat: 46.31716477600904, elevation: 1500, webcam: 'https://www.bosco-gurin.ch/bg_webcam.jpg'}
].each do |location_params|
  l = Location.create location_params
  puts "location created: #{l.name}"
end