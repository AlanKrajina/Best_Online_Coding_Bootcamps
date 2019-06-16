require 'open-uri'
require 'nokogiri'
require "pry"

class BestOnlineCodingBootcamps::Scraper

  def self.scrape_index_page
    html = open("https://www.switchup.org/rankings/best-online-bootcamps")
    doc = Nokogiri::HTML(html)

    doc.css("li div.ranking-item").each do |camp|

        name = camp.css("div.ranking-item__header--left h3 a").text
        rating = camp.css("div.ranking-item__header--left span.ranking-item__rating--value").text.split.join(' ')
        subjects = camp.css("table tr:nth-child(3) td").text.split.join(' ')
        url = camp.css("div.ranking-item__header h3 a").attribute("href").value 
        BestOnlineCodingBootcamps::Bootcamps.new(name, rating, subjects, url)
        
    end
  end     

  def self.scrape_details(bootcamps)
    html = open("https://www.switchup.org#{bootcamps.url}")
    doc = Nokogiri::HTML(html)
#    binding.pry
#      about = doc.css("h2.topic-title").text
#      website =
#      locations =
#      programs =
#      scholarships = 
#      info =
  end
  
end  