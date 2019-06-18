require 'open-uri'
require 'nokogiri'
class BestOnlineCodingBootcamps::Scraper

  def self.scrape_index_page
    html = open("https://www.switchup.org/rankings/best-online-bootcamps")
    doc = Nokogiri::HTML(html)
    
    doc.css("li div.ranking-item").each do |camp|
        name = camp.css("div.ranking-item__header--left h3 a").text
        rating = camp.css("div.ranking-item__header--left span.ranking-item__rating--value").text.split.join(' ')
        subjects = camp.css("table tr:nth-child(3) td").text.split.join(' ')
        url = camp.css("div.ranking-item__header h3 a").attribute("href").value 
        BestOnlineCodingBootcamps::Bootcamps.new(name,rating,subjects,url)
    end
  end     

  def self.scrape_details(bootcamps)
    html = open("https://www.switchup.org#{bootcamps.url}")
    doc = Nokogiri::HTML(html)
    
    cnd1 = doc.css("div.span12 blockquote.topic-text p").text.include? "..." 
    cnd2 = doc.css("div.extra-info p:nth-child(3) span").text.include? "..."
    cnd3 = doc.css("div.extra-info p:nth-child(2) span").text.include? "..."
    cnd4 = doc.css("div.extra-info p:nth-child(1) span").text.include? "..."
    bootcamps.about = doc.css("h2.topic-title").text.split.join(' ')
    bootcamps.website = doc.css("div.ranking-item a").attribute("href").value 
    
      if cnd3  
        bootcamps.programs = doc.css("div.extra-info p:nth-child(2) span a").attribute("onclick").value[23..-18]
        else 
          bootcamps.programs = doc.css("div.extra-info p:nth-child(2) span").text.split.join(' ') end
 
      if cnd4
        bootcamps.locations = doc.css("div.extra-info p:nth-child(1) span a").attribute("onclick").value[23..-18]
        else
          bootcamps.locations = doc.css("div.extra-info p:nth-child(1) span").text.split.join(' ') end   
      
      if !cnd1 
       bootcamps.info = doc.css("div.span12 blockquote.topic-text p").text.chomp 
        elsif cnd1 && !doc.css("div.span12 blockquote.topic-text p a").attribute("href").value.include?("https")
        bootcamps.info = doc.css("div.span12 blockquote.topic-text p a").attribute("onclick").value[35..-24].gsub("<\\/p>\\n\\n<p>", " ").gsub("\\n<br />", " ").gsub("\\", " ") 
        else 
          bootcamps.info = doc.css("div.span12 blockquote.topic-text p").text.chomp end
  end
end  