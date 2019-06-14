require 'open-uri'
require 'nokogiri'

class ForTheLoveOfDogs::Scraper

  def self.scrape_index_page
    html = open("https://www.battersea.org.uk/dogs/dog-rehoming-gallery")
    doc = Nokogiri::HTML(html)
    binding.pry
    dogs = []

#    doc.css(".student-card").each do |student|
#      student_index_array << {
#        :name => student.css("h4.student-name").text,
#        :location => student.css("p.student-location").text,
#        :profile_url => student.css("a").attribute("href").value
#      }
#    end
#    dogs
  end

#  def self.scrape_bootcamp_page(bootcamp_url)

#  end
end