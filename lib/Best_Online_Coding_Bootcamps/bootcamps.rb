require "pry"
class BestOnlineCodingBootcamps::Bootcamps
    attr_accessor :name, :rating, :subjects, :url, :about, :website, :locations, :programs, :scholarships, :info

  @@all = []
  
  def initialize(name,rating,subjects,url)
    @name = name
    @rating = rating
    @subjects = subjects
    @url = url
    save
  end

 def save
   @@all << self
 end

 def self.all
   @@all
 end

 def get_details
   BestOnlineCodingBootcamps::Scraper.scrape_details(self)
 end
 
end