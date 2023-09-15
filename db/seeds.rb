# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"

puts "deleting data"
Movie.destroy_all
puts "#{Movie.all.count}"

url = "https://tmdb.lewagon.com/movie/popular"
movies = JSON.parse(URI.open(url).read)

movies["results"].each do |movie|
  puts "creating movie"
  Movie.create(
    title: movie["original_title"],
    year: movie["release_date"],
    description: movie["overview"],
  )
end

puts "#{Movie.all.count}"
puts "finished seeding"
