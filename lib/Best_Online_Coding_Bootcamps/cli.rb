class BestOnlineCodingBootcamps::CLI
  
  def call
    start
  end


  def start
    puts "This is the list of all bootcamps:"
    puts "1.LEVEL list of all bootcamps..."
    
    @bootcamp = BestOnlineCodingBootcamps::Bootcamps.all
        @bootcamp.each do |camp|
        puts "#{camp.name} -- #{camp.rating} -- #{camp.subjects}"
        end
    
    
    puts "Type a number to select the bootcamp you want more info"
    input = gets.strip

    bootcamps = BestOnlineCodingBootcamps::Bootcamps.find_all(input.to_i)

    prints(bootcamps)

  end


  def prints(bootcamps)
#    binding.pry
      puts "#{bootcamps.about}"
      puts "#{bootcamps.website}"
      puts "#{bootcamps.locations}"
      puts "#{bootcamps.programs}"
      puts "#{bootcamps.scholarships}"
  end

end

