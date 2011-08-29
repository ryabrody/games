def prompt
  print ">> "
end

def failed(why)
  puts "You're failed. #{why} Go and pick your own coffee to work!"
end

def win(why)
  puts "#{why} Hell yeah! Damn that coffee smells goood !!!"
end

def start
  puts "It's monday morning. If you be at 8:15 a.m. at work you'll get a coffee for free!"
  puts "Do you go to work by car or train?"
  
  prompt; next_move = gets.chomp
  
  if next_move.include? "car" 
    by_car
  elsif next_move.include? "train"
    by_train
  else
    puts "I don't understand what you typed in. Try it again:"
    start
  end
end

def by_car
  puts "You're sitting in your Porsche and listening to the radio. You hear about a traffic jam on the highway. Do you still want to drive on the highway or do you drive on the main street?"
  
  prompt; next_move = gets.chomp

  if next_move.include? "highway"
    failed("Ou man, why did't you listening to the radio? You're waiting in the main traffic for 2 hours!")
  elsif next_move.include? "main street"
    on_the_main_street
  else
    puts "I don't understand what you typed in. Try it again:"
    by_car
  end
end

def on_the_main_street
  puts "Good choice! You arrived at the office. It's now 8:10 a.m. it tooks 10 minutes longer because you took the main street."
  puts "Well, there are three parkfields free. Which one do you take? The first, second or third?"
  puts "Type the number of the parkfield:"
  
  prompt; next_move = gets.chomp
  
  unless next_move =~ /\D/
    which_number = next_move.to_i
  else
    puts "Learn to type a number. Try it again:"
    on_the_main_street
  end
  
  if which_number == 2
    elevator_stairs
  elsif which_number > 3 or which_number < 1
    puts "Learn to type a number between 1 und 3"
    on_the_main_street
  else
    failed("While you're parking your car, a cat run in front of the car and you killed it. Shame on you! It tooks 2 hours to find the owner of the cat.")
  end
  
end

def elevator_stairs
  puts "Ok, nice, your car is parked now."
  puts "You enter your office. The coffee machine is on the third floor."
  puts "Do you take the elevator or the stairs?"
  
  prompt; next_move = gets.chomp
  
  if next_move.include? "stairs"
    win("Well done!")
  elsif next_move.include? "elevator"
    failed("A stupid person smoked in the elevator and because of that, the elevator stops. It tooks half an hour until the elevator goes on.")
  else
    puts "I don't understand what you typed in. Try it again:"
    elevator_stairs
  end
end

def by_train
  
  trains = ['"slowly" leaves at 7:10 a.m. and arravies at 8:00 a.m. with 8 stops', '"speedy" leaves at 7:30 a.m. and arrives at 8:01 a.m. with 0 stops.' ]
  
  puts "Nice you took the train. That's good for our environment! RESPECT! Well the following trains drive:"
  
  trains.each do |train|
    puts "#{train}"
  end
  
  puts "Which train do you take?"
  prompt; next_step = gets.chomp
  
  if next_step.include? "slowly"
    toyota_porsche
  elsif next_step.include? "speedy"
    failed("Because of an accident both trains are too late. It tooks 20 minutes until the train arrives at the trainstation.")
  else
    puts "I don't understand what you typed in. Try it again:"
    by_train
  end
end

def toyota_porsche
  puts "Because of an accident both trains are too late. It's 7:10 a.m. and you went home to go to work with your car. Which car do you take? The Toyota or the Porsche?"
  
  prompt; next_step = gets.chomp
  
  if next_step.include? "Porsche"
    at_traffic_jam
  elsif next_step.include? "Toyota"
    failed("While you're driving to work with your Toyota a wheel felt off your car. After you spell out some ugly words, you called the roadside Assistance. This tooks three hours.")
  else
    puts "I don't understand what you typed in. Try it again:"
    toyota_porsche
  end
end

def at_traffic_jam
  puts "Ouw damn. You get into a traffic jam. What do you do now? Do you drive on the hard shoulder or wait?"
  
  prompt; next_step = gets.chomp
  
  if next_step.include? "hard shoulder"
    win("You drive on the hard shoulder successful to work and arrived pointly at 8:15 a.m. in front of the coffee machine.")
  elsif next_step.include? "wait"
    failed("You wait for 2 hours in the traffic jam.")
  else 
    puts "I don't understand what you typed in. Try it again:"
    at_traffic_jam 
  end
end

start
  