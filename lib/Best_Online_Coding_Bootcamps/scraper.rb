require 'open-uri'
require 'nokogiri'
require "pry"

class BestOnlineCodingBootcamps::Scraper

  def self.scrape_index_page
 #   html = open("https://www.switchup.org/rankings/best-online-bootcamps")
    html = open("https://www.switchup.org/bootcamps/general-assembly")
    doc = Nokogiri::HTML(html)
    
        about = doc.css("h2.topic-title").text.split.join(' ')
        website = doc.css("div.ranking-item a").attribute("href").value 
        locations = doc.css("div.extra-info p:nth-child(1) span").text.split.join(' ')
        programs = doc.css("div.extra-info p:nth-child(2) span").text.split.join(' ')
        scholarships = doc.css("div.extra-info p:nth-child(3) span").text.split.join(' ')
        info = doc.css("div.span12 blockquote.topic-text p").text
    
    binding.pry
    
=begin
[1] pry(BestOnlineCodingBootcamps::Scraper)> locations
=> "Dallas, Providence, San Diego, San Francisco, Seattle, NYC, Washing... ViewMore"
[2] pry(BestOnlineCodingBootcamps::Scraper)> programs
=> "Coding Bootcamps, Web Design (UX/UI), Data Science, Produ... View More"
[3] pry(BestOnlineCodingBootcamps::Scraper)> scholarships
=> "General Assembly's Opportunity Fund offers scholarships for women, ... ViewMore"    
=end

=begin
    doc.css("li div.ranking-item").each do |camp|

        name = camp.css("div.ranking-item__header--left h3 a").text
        rating = camp.css("div.ranking-item__header--left span.ranking-item__rating--value").text.split.join(' ')
        subjects = camp.css("table tr:nth-child(3) td").text.split.join(' ')
        url = camp.css("div.ranking-item__header h3 a").attribute("href").value 
        BestOnlineCodingBootcamps::Bootcamps.new(name, rating, subjects, url)
        
    end
=end
  end     
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