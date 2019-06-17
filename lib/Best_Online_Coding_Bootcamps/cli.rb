require 'colorize'


class BestOnlineCodingBootcamps::CLI
  
  def call
    start
  end


  def start
    puts "This is the list of all bootcamps:".on_blue

    bootcamps = BestOnlineCodingBootcamps::Bootcamps.all
        bootcamps.each_with_index do |camp,index|
        puts "#{index+1}. #{camp.name}".red
        puts "  Rating: #{camp.rating}"
        puts "  Subjects: #{camp.subjects}"
        end
    
    
    puts "Type a number to select the bootcamp you want more info".on_blue

    input = gets.strip

    bootcamp = BestOnlineCodingBootcamps::Bootcamps.find_all(input.to_i)
    
    #if statement so it doesnt repeat scraping
    bootcamp.get_details
    prints(bootcamp)

  end


  def prints(bootcamp)
      puts ""
      puts " #{bootcamp.about}:".red
      puts " "
      puts "--------------------------------Website:----------------------------------------".light_blue
      puts " "
      puts "#{bootcamp.website}"
      puts "--------------------------------Locations:--------------------------------------".light_blue
      puts " "
      puts "#{bootcamp.locations}"
      puts "--------------------------------Programs:---------------------------------------".light_blue
      puts " "
      puts "#{bootcamp.programs}"
      puts "--------------------------------------------------------------------------------".light_blue
  end

end

