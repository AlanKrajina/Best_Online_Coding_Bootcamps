require 'open-uri'
require 'nokogiri'

class ForTheLoveOfDogs::Scraper

  def self.scrape_index_page
    html = open("https://www.switchup.org/rankings/best-online-bootcamps")
    doc = Nokogiri::HTML(html)
    bootcamps = []


  doc.css(".ranking-item").each do |bootcamp|
      bootcamps << {
        :name => bootcamp.css("div.ranking-item__header--left h3 a").text,
        :rating => bootcamp.css("div.ranking-item__header--left span.ranking-item__rating--value").text.split.join(' '),
        :subjects => bootcamp.css("table tr:nth-child(3) td").text.split.join(' ')
      }
  end
# problem je prvi ranking item {:name=>"", :rating=>"", :subjects=>""}    
#     if bootcamp.css("div.ranking-item__header--left h3 a").text != nil
# end

    binding.pry

    bootcamps
  end     


  def self.scrape_bootcamp_page

    bootcamp_profile = {}
    
# html link svakog    
    html = open(profile_url)
    profile = Nokogiri::HTML(html)


      profile_url = "./fixtures/student-site/students/joe-burgess.html"






    profile.css("div.main-wrapper.profile .social-icon-container a").each do |social|
      if social.attribute("href").value.include?("twitter")
        student_profile[:twitter] = social.attribute("href").value
      elsif social.attribute("href").value.include?("linkedin")
        student_profile[:linkedin] = social.attribute("href").value
      elsif social.attribute("href").value.include?("github")
        student_profile[:github] = social.attribute("href").value
      else
        student_profile[:blog] = social.attribute("href").value
      end
    end

    student_profile[:profile_quote] = profile.css("div.main-wrapper.profile .vitals-text-container .profile-quote").text
    student_profile[:bio] = profile.css("div.main-wrapper.profile .description-holder p").text
    doc.css(".main-wrapper div.social-icon-container").each do |link|
    array <<  link.css("a").attribute("href").value

    student_profile
  end



  end



end     
