require 'colorize'


class BestOnlineCodingBootcamps::CLI
  
  def call
    start
  end


  def start
    puts ""
    print "Welcome to the 2019 Best Online Coding Bootcamps list by: "
    puts "Switchup".blue
    puts ""
    puts "Press '1' if you would like to see the list or press '2' to exit"
    
    input = gets.strip
      case input
    puts "Here's our list:"
    
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

