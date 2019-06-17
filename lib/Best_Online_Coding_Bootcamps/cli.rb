require 'colorize'


class BestOnlineCodingBootcamps::CLI
  
  def call
    start
  end


  def start
    puts "This is the list of all bootcamps:"
    puts "1.LEVEL list of all bootcamps..."
    
    bootcamps = BestOnlineCodingBootcamps::Bootcamps.all
        bootcamps.each_with_index do |camp,index|
        puts "#{index+1}. #{camp.name}".on_blue
        puts "  Rating: #{camp.rating}".light_blue
        puts "  Subjects: #{camp.subjects}".light_blue
        end
    
    
    puts "Type a number to select the bootcamp you want more info"
    puts "2.LEVEL list of all bootcamps..."

    input = gets.strip

    bootcamp = BestOnlineCodingBootcamps::Bootcamps.find_all(input.to_i)
    #if statement so it doesnt repeat scraping
    bootcamp.get_details
    prints(bootcamp)

  end


  def prints(bootcamp)
      puts "#{bootcamp.about}"
      puts "#{bootcamp.website}"
      puts "#{bootcamp.locations}"
      puts "#{bootcamp.programs}"
      puts "#{bootcamp.scholarships}"
  end

end

