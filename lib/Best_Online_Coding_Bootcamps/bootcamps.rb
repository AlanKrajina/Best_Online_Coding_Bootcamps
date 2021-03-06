class BestOnlineCodingBootcamps::Bootcamps
    attr_accessor :name, :rating, :subjects, :url, :about, :website, :locations, :programs, :info

  @@all = []
  
  def initialize(name,rating,subjects,url)
    @name = name
    @rating = rating
    @subjects = subjects
    @url = url
    @@all << self
  end
  
  def self.all
   @@all.empty? ? BestOnlineCodingBootcamps::Scraper.scrape_index_page : nil
   @@all
  end
  
  def self.find_all(id)
    self.all[id-1]
  end

  def get_details
   BestOnlineCodingBootcamps::Scraper.scrape_details(self)
  end
end