require 'open-uri'
require 'nokogiri'

class ForTheLoveOfDogs::Scraper

  def self.scrape_index_page
    html = open("https://www.switchup.org/rankings/best-online-bootcamps")
    doc = Nokogiri::HTML(html)
    bootcamps = []


  doc.css(".ranking-item").each do |bootcamp|
      bootcamps << {
        :name => bootcamp.css("div.ranking-item__header--left h3 a").text,
        :rating => bootcamp.css("div.ranking-item__header--left span.ranking-item__rating--value").text.split.join(' '),
        :subjects => bootcamp.css("table tr:nth-child(3) td").text.split.join(' '),
        :url => bootcamp.css("div.ranking-item__header h3 a").attribute("href").value 
      }
  end
# problem je prvi ranking item {:name=>"", :rating=>"", :subjects=>""}    
#     if bootcamp.css("div.ranking-item__header--left h3 a").text != nil
# end

#    binding.pry

    bootcamps
  end     

=begin
  def self.scrape_bootcamp_page

    bootcamp_profile = {}
    
# html link svakog    
    html = open(profile_url)
    profile = Nokogiri::HTML(html)


 
 
 def self.scrape_pet_profile(url)
    pet_profile_details = {}

    pet_profile = "http://bestfriends.org" + url
    doc = Nokogiri::HTML(open(pet_profile))






  end


=end
end     
