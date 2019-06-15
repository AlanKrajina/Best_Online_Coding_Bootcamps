require 'open-uri'
require 'nokogiri'

class BestOnlineCodingBootcamps::Scraper

  def self.scrape_index_page
    html = open("https://www.switchup.org/rankings/best-online-bootcamps")
    doc = Nokogiri::HTML(html)
    bootcamps = []


  doc.css("li div.ranking-item").each do |bootcamp|
      bootcamps << {
        :name => bootcamp.css("div.ranking-item__header--left h3 a").text,
        :rating => bootcamp.css("div.ranking-item__header--left span.ranking-item__rating--value").text.split.join(' '),
        :subjects => bootcamp.css("table tr:nth-child(3) td").text.split.join(' '),
        :url => bootcamp.css("div.ranking-item__header h3 a").attribute("href").value 
      }
  end
#  binding.pry
    bootcamps
  end     

#  def self.scrape_bootcamp_page(url)

 #   bootcamp_profile = {}
    
#    bootcamp_profile = "https://www.switchup.org/rankings/best-online-bootcamps" + url
#    doc = Nokogiri::HTML(open(bootcamp_profile))


 
 


#  end


end     
