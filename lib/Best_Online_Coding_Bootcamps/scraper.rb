require 'open-uri'
require 'nokogiri'
require "pry"

class BestOnlineCodingBootcamps::Scraper

  def self.scrape_index_page
 #   html = open("https://www.switchup.org/rankings/best-online-bootcamps")
    html = open("https://www.switchup.org/bootcamps/coding-dojo")
    doc = Nokogiri::HTML(html)
    
        about = doc.css("h2.topic-title").text.split.join(' ')
        website = doc.css("div.ranking-item a").attribute("href").value 
        scholarships = doc.css("div.extra-info p:nth-child(3) span").text.split.join(' ')
        info = doc.css("div.span12 blockquote.topic-text p").text
        
        doc.css("div.extra-info p:nth-child(2) span").text.include? "..." ? programs = doc.css("div.extra-info p:nth-child(2) span a").attribute("onclick").value[23..-18] : programs = doc.css("div.extra-info p:nth-child(2) span").text.split.join(' ')
        
        
       
        if doc.css("div.extra-info p:nth-child(1) span").text.include? "..." then locations = doc.css("div.extra-info p:nth-child(1) span a").attribute("onclick").value[23..-18] elsif !doc.css("div.extra-info p:nth-child(1) span").text.include? "..." then locations = doc.css("div.extra-info p:nth-child(1) span").text.split.join(' ') end
  
     binding.pry
  
#  a ? b : c
# if a then b else c end

#        foo = true
#a = foo  ? 'a' : (bar ? 'b' : 'c') #=> "a"
        
#        elsif doc.css("div.extra-info p:nth-child(1) span").text.include? "..."
#        locations = doc.css("div.extra-info p:nth-child(1) span a").attribute("onclick").value[23..-18]
          
#        else
        
#        locations = doc.css("div.extra-info p:nth-child(1) span").text.split.join(' ')
         
#        end
  end     
    


=begin
    doc.css("li div.ranking-item").each do |camp|

        name = camp.css("div.ranking-item__header--left h3 a").text
        rating = camp.css("div.ranking-item__header--left span.ranking-item__rating--value").text.split.join(' ')
        subjects = camp.css("table tr:nth-child(3) td").text.split.join(' ')
        url = camp.css("div.ranking-item__header h3 a").attribute("href").value 
        BestOnlineCodingBootcamps::Bootcamps.new(name, rating, subjects, url)
        
    end
=end
=begin
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
=end  
end  