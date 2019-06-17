require "pry"
class BestOnlineCodingBootcamps::Bootcamps
    attr_accessor :name, :rating, :subjects, :url, :about, :website, :locations, :programs, :scholarships, :info

  @@all = []
  
  def initialize(name,rating,subjects,url)
    @name = name
    @rating = rating
    @subjects = subjects
    @url = url
    @@all << self
  end

  def self.all
#    binding.pry
#   @@all.empty? ? BestOnlineCodingBootcamps::Scraper.scrape_index_page : nil
   @@all
  end
  
  def self.find(id)
    self.all[id-1]
  end

  def get_details
   BestOnlineCodingBootcamps::Scraper.scrape_details(self)
  end
 
end