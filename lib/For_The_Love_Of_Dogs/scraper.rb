require 'open-uri'
require 'nokogiri'

class ForTheLoveOfDogs::Scraper

  def self.scrape_index_page
    html = open("https://www.switchup.org/rankings/best-online-bootcamps")
    doc = Nokogiri::HTML(html)
    bootcamps = []

 #   doc.css(".ranking-item ").each do |dog|
#      dogs << {
#        :name => dog.css(".ranking-item__header--left a").text,
#        
#        :age => dog.css(".animal_name a.ng-binding").text,
#        :centre => dog.css(".animal_name a.ng-binding").text
        
#      }
     
#    end
    
     binding.pry
#doc.css(".ranking-item div.ranking-item__header--left h3 a").text
#[4] pry(ForTheLoveOfDogs::Scraper)> doc.css(".ranking-item div.ranking-item__header--left h3 a").text
#=> "App AcademyGeneral AssemblyBlocSpringboardThinkfulNYC Data Science AcademyCoding DojoFlatiron SchoolThe Tech AcademyProduct SchoolDataquestHack ReactorActualizeCodesmithRMOTRBrainStationLambda SchoolDesignlabFullstack AcademyThe Software GuildAltcademyMetisGalvanizeDev MountainSkillcrushCareerFoundryFirst Step CodingCode InstituteEvolve Security AcademyHyperion DevelopmentV SchoolDataCampHelio Training BootcampByte AcademyThe Firehose ProjectCodingNomadsLevelBottegaB9labAcademyThe Data IncubatorOpenClassroomsDesign Sprint SchoolBitDegreeScience to Data ScienceCodecademyTreehouse"





    dogs
  end

#  def self.scrape_bootcamp_page(bootcamp_url)

#  end
end