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
words = doc.css("div#post-body-6077576339513753770").text.split("\n")
words.delete_if { |x| x.empty? }
user = User.create(email: "test@test.com", password: 123, password_confirmation: 123)
puts "Start parsing..."
i=0
 words.map do |w|
   word = w.split(/([^\[]+)(\[[^\]|\[|\)]+\]?\[?\)?)\s?-?–?\s?(.*)/)
   word.delete_if { |x| x.empty? }
   user.cards.create(original_text: word[2], translated_text: word[0].strip, review_date: (Date.today - 3.days))
   i+=1
 end
puts "Parsing is finished. Added " + i.to_s + " words"


