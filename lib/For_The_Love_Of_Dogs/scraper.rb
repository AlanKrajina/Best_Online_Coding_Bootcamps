require 'open-uri'
require 'nokogiri'

class ForTheLoveOfDogs::Scraper

  def self.scrape_index_page
    html = open("https://www.battersea.org.uk/dogs/dog-rehoming-gallery")
    doc = Nokogiri::HTML(html)
    dogs = []

    doc.css(".listing_animal").each do |dog|
      dogs << {
        :name => dog.css(".animal_name a.ng-binding").text,
        
        :age => dog.css(".animal_name a.ng-binding").text,
        :centre => dog.css(".animal_name a.ng-binding").text
        
      }
     binding.pry
     
    end
    
    dogs
  end

#  def self.scrape_bootcamp_page(bootcamp_url)

#  end
end