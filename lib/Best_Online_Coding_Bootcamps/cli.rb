require 'colorize'


class BestOnlineCodingBootcamps::CLI
  
  def call
    beginning  
    start
  end

  def start
    input = gets.strip.to_i
      if input == 1
          puts ""
          puts "Here is our list:".upcase.blue
          puts ""
          @bootcamps = BestOnlineCodingBootcamps::Bootcamps.all
            @bootcamps.each_with_index do |camp,index|
            puts "#{index+1}. #{camp.name}".red
            print "  Rating: ".light_blue
            puts "#{camp.rating}"
            print "  Subjects: ".light_blue
            puts "#{camp.subjects}"
          end
        else 
          puts "Wrong input, try again.".red
          start
        end
        
    puts ""
    puts "Enter a number to get more information about the bootcamp.".yellow

    input = gets.to_i
      
    if input <= 46 && input > 0
      
    bootcamp = BestOnlineCodingBootcamps::Bootcamps.find_all(input.to_i)
    
    #if statement so it doesnt repeat scraping
    
    
    bootcamp.get_details
    prints(bootcamp)

    else
      puts ""
      puts "Wrong input, press '1' to see the list again.".red
      start
    end

    puts ""
    puts "Would you like to see another bootcamp? Enter Y or N".yellow

    input = gets.strip.downcase
    if input == "y"
      puts "Enter '1' to open the list.".yellow
      start    
    elsif input == "n"
      puts ""
      puts "Good luck and Happy coding!".on_blue
      puts ""
      exit
    else
      puts ""
      puts "Wrong input, try again.".red
      start
end
  end

  def beginning 
    puts ""
    print "Welcome to the 2019 Best Online Coding Bootcamps list by: ".yellow
    puts "Switchup".upcase.red
    puts ""
    puts "Enter '1' if you would like to see the list.".yellow 
  end

  def prints(bootcamp)
      puts ""
      puts " #{bootcamp.about}:".upcase.red
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

