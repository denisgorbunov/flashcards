# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "nokogiri"
require "open-uri"
url = "http://poligloty.blogspot.ru/2013/08/1000-english-words.html"
html = open(url)
doc = Nokogiri::HTML(html)
words = doc.css("div#post-body-6077576339513753770").text.split("\n") #to_s.gsub('<br>','\n')).text.split('\n').map { |x| x.split(/([^\[]+)(\[[^\]]+\])\s?-\s?(.*)/) }

words.map do |w|
  w.delete
end

 words.map do |w|
   word = w.split(/([^\[]+)(\[[^\]]+\])\s?-\s?(.*)/)
   word.delete_if { |x| x.empty? }
   Card.create!(original_text: word[4], translated_text: word[1])
 end

