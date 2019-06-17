class BestOnlineCodingBootcamps::CLI
  
  def call
    start
  end


  def start
  
    input = gets.strip

    bootcamps = BestOnlineCodingBootcamps::Bootcamps.find(input.to_i)

    prints(bootcamps)

  end



  def prints(bootcamps)
      puts "#{bootcamps.name}"
      puts "#{bootcamps.rating}"
      puts "#{bootcamps.url}"
      puts "#{bootcamps.about}"
      puts "#{bootcamps.website}"
      puts "#{bootcamps.locations}"
      puts "#{bootcamps.programs}"
      puts "#{bootcamps.scholarships}"
  end

end



=begin

  puts "Welcome to our little shelter 'For_The_Love_Of_Dogs'!"
  show_all_dogs
  show_dog
  goodbye
end
  
  def show_all_dogs
  puts "These are all of our furry companions that you can take home today:"  
  

  #  @dogs = ForTheLoveOfDogs::Dogs.today
    @dogs.each.with_index(1) do |dog, i|
      puts "#{i}. #{dog.name} - #{dog.age} - #{dog.centre}"
    end

  
  end
  
  
  
  def show_dog

    input = nil
    while input != "exit"
      puts "Enter the number of the dog you'd like more info on or type 'back' to see the them all again or type 'exit':"
      input = gets.strip.downcase

      if input.to_i > 0 || input.to_i <= @dogs.length

        the_dog = @dogs[input.to_i-1]

    puts ""
    puts "---------------- #{the_dog.name} ---------------"
    puts ""
    puts "Age:             #{the_dog.age}"
    puts "Breed:           #{the_dog.breed}"
    puts "Age:             #{the_dog.sex}"
    puts "Size:            #{the_dog.size}"
    puts "Centre:          #{the_dog.centre}"
    puts ""
    puts "-------------------Information------------------"
    puts ""
    puts "#{the_dog.info}"
    puts ""       
    
      elsif input == "back"
        show_all_dogs
      else
        puts "Invalid input, type 'back' or 'exit'."
      end
    end
  end
  
  def goodbye
    puts "Hope you liked our little furries. Come back again soon!"
  end
end
=end
