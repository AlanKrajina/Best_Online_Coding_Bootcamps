require 'open-uri'
require 'nokogiri'

class BestOnlineCodingBootcamps::Scraper

  def self.scrape_index_page
    html = open("https://www.switchup.org/rankings/best-online-bootcamps")
    doc = Nokogiri::HTML(html)


    doc.css("li div.ranking-item").each do |camp|
        bootcamp = ForTheLoveOfDogs::Dogs.new
  
        bootcamp.name = camp.css("div.ranking-item__header--left h3 a").text
        bootcamp.rating = camp.css("div.ranking-item__header--left span.ranking-item__rating--value").text.split.join(' ')
        bootcamp.subjects = camp.css("table tr:nth-child(3) td").text.split.join(' ')
        bootcamp.url = camp.css("div.ranking-item__header h3 a").attribute("href").value 
        bootcamp.save
    end
  end     


 


end     
