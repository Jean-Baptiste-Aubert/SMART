# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"
require "nokogiri"
require "json"

html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)

result = (1..10).map do |page|
  url = "https://collections.louvre.fr/recherche?page=#{page}&q=original"
  urls = html_doc.search(".card_title").map do |element|
    puts element.text.strip
    puts element.attribute("href").value
    path = element.search("a").first.attributes("href").value
    "https://collections.louvre.fr/en#{path}.json"
  end

  urls.map do |url|
    html_file = URI.open(url).read
    html_doc = JSON.parse(html_file)
    html_doc("title")
  end
end

p result
