=begin
require 'unirest'

puts "Enter Meesage of your choice for phrases classification"
inputis = gets.chomp
response1 = Unirest.post "https://japerk-text-processing.p.mashape.com/phrases/",
  headers:{
    "X-Mashape-Key" => "",
    "Content-Type" => "application/x-www-form-urlencoded",
    "Accept" => "application/json"
  },
  parameters:{
    "language" => "spanish",
    "text" => "#{inputis}"
  }
  
  
  puts(response1.body)
  
  
  puts "Enter Meesage of your choice for sentiment classification"
  inputtwo = gets.chomp
  response = Unirest.post "https://japerk-text-processing.p.mashape.com/sentiment/",
  headers:{
    "X-Mashape-Key" => "",
    "Content-Type" => "application/x-www-form-urlencoded",
    "Accept" => "application/json"
  },
  parameters:{
    "language" => "english",
    "text" => "#{inputtwo}"
  }
  puts(response.body)
=end

require 'aylien_text_api'
puts "Enter Meesage of your choice"
inputis = gets.chomp
textapid = AylienTextApi::Client.new()
output = textapid.sentiment text: "#{inputis}"

puts output

#puts output

=begin
1) sentiment
textapid.sentiment text: "#{inputis}"

2) classification
classifications = client.classify(url: url)

classifications[:categories].each do |category|
  puts category
end

3)classification by taxtonamy

4)concept extraction
.concepts(text: text)
response[:concepts].each do |concept, value|
  surface_forms = value[:surfaceForms].map { |c| c[:string] }.join(', ')
  puts "#{concept}:#{surface_forms}"
end

5) entity extraction
text = "ACME corp was founded by John Smith in Chicago."

response = client.entities(text: text)

response[:entities].each do |type, values|
  puts "#{type}, #{values}"
end

6)summarization
url = 'http://techcrunch.com/2015/04/06/john-oliver-just-changed-the-surveillance-reform-debate'

summary = client.summarize(url: url, sentences_number: 3)

summary[:sentences].each do |sentence|
  puts sentence
end

7) Article extraction
url = "http://techcrunch.com/2015/04/06/john-oliver-just-changed-the-surveillance-reform-debate"

extract = client.extract(url: url, best_image: true)

puts extract

=end