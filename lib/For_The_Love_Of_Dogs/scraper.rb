require 'open-uri'
require 'nokogiri'

class ForTheLoveOfDogs::Scraper

  def self.scrape_index_page
    html = open("https://www.switchup.org/rankings/best-online-bootcamps")
    doc = Nokogiri::HTML(html)
    bootcamps = []

   doc.css(".ranking-item").each do |dog|
      bootcamps << {
        :name => dog.css("div.ranking-item__header--left h3 a").text,
        
        :rating => dog.css("div.ranking-item__header--left span.ranking-item__rating--value").text.split.join(' '),
        :subjects => dog.css(".animal_name a.ng-binding").text
        
      }
     
    end
    
     binding.pry

    bootcamps
  end     
end     
     
#doc.css(".ranking-item div.ranking-item__header--left h3 a").text
#[4] pry(ForTheLoveOfDogs::Scraper)> doc.css(".ranking-item div.ranking-item__header--left h3 a").text
#=> "App AcademyGeneral AssemblyBlocSpringboardThinkfulNYC Data Science AcademyCoding DojoFlatiron SchoolThe Tech AcademyProduct SchoolDataquestHack ReactorActualizeCodesmithRMOTRBrainStationLambda SchoolDesignlabFullstack AcademyThe Software GuildAltcademyMetisGalvanizeDev MountainSkillcrushCareerFoundryFirst Step CodingCode InstituteEvolve Security AcademyHyperion DevelopmentV SchoolDataCampHelio Training BootcampByte AcademyThe Firehose ProjectCodingNomadsLevelBottegaB9labAcademyThe Data IncubatorOpenClassroomsDesign Sprint SchoolBitDegreeScience to Data ScienceCodecademyTreehouse"






#  def self.scrape_bootcamp_page(bootcamp_url)

#  end
