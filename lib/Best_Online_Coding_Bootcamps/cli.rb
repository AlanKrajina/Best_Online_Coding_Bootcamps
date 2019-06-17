class BestOnlineCodingBootcamps::CLI
  
  def call
    start
  end


  def start
    puts "This is the list of all bootcamps:"
    puts "1.LEVEL list of all bootcamps..."
    
    bootcamps = BestOnlineCodingBootcamps::Bootcamps.all
        bootcamps.each do |camp|
        puts "#{camp.name} -- #{camp.rating} -- #{camp.subjects}"
        end
    
    
    puts "Type a number to select the bootcamp you want more info"
    input = gets.strip

    bootcamp = BestOnlineCodingBootcamps::Bootcamps.find_all(input.to_i)

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

