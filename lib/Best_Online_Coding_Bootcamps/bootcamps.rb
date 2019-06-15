require "pry"
class BestOnlineCodingBootcamps::Bootcamps
    attr_accessor :name, :rating, :subjects, :url


# default object creating class method
  def self.create_from_collection(bootcamps)
    bootcamps.each do |bootcamp|
      Bootcamps.new(bootcamp)
    end  
  end


  def scrape_and_create_camps
    hash_of_camps = Scraper.scrape_index_page
#    @bootcamp_object.create_from_collection(hash_of_camps)
  end

#    binding.pry
  binding.pry  






=begin

#creates new_bootcamp object

  
# hash?
  def initialize(student_hash)
    student_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end
=end
end