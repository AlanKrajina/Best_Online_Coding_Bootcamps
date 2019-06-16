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
        BestOnlineCodingBootcamps::Bootcamps.new(name, rating, subjects, url)
    end
  end     
  

  def self.scrape_details(bootcamps)
    doc = Nokogiri::HTML(open("https://www.switchup.org/rankings/best-online-bootcamps#{bootcamps.url}"))
    doc.css("article.copy p.litNoteText").each do |paragraph|
      topic.content << paragraph.text.strip
    end
  end
 


end     
