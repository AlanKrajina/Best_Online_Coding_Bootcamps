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
        
      }
     
    end
    
     binding.pry

    bootcamps
  end     
end     







#  def self.scrape_bootcamp_page(bootcamp_url)

#  end
