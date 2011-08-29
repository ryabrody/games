class TrainingRoom
  include MarkupHelper
  include DeathHelper
  
  GOOD_CHOICE = 5
  BAD_CHOICE = 10
  
  def initialize
    @status = Assets.training
  end
    
  def enter
    explain_choices     
    loop do
      prompt
      action = gets.chomp.to_i
      case action
      when 5
        first_choice(1)
        return StylingRoom
      when 10
        second_choice(1)
      else
        invalid_input
      end
    end
  end
  
  private
  def explain_choices
    puts <<-PARAGRAPH
    Johnny needs hard training to stay fit. So it's time to
    do something.
    You go with Johnny to a training hall, where other lovely cats
    also do their training.
    Now it's your turn to say Johnny how much he has to work.
    Type "5" if you want Johnny to take a easy training.
    Or Type "10" if you want Johnny to take a hard training.      
    PARAGRAPH
  end
  
  def first_choice(i)
    numbers = []
      while i <= 5
        puts "Training ##{i}"
        puts @status
        sleep 1
        numbers.push(i)
        i = i + 1
      end
      space
      puts "Well Done ! You can be proud about Johnny\n"
      space
      pause
  end
  
  def second_choice(i)
    numbers = []
    while i <= 10
      puts "Training ##{i}"
      sleep 1
      puts @status
      numbers.push(i)
      i = i + 1
      break if i == 6
    end
    training_interrupt(i)
  end
  
  def invalid_input
    space
    puts "Try to type 5 or 10. I believe in you, you get it!"
  end

  def training_interrupt(i)
    space
    puts <<-PARAGRAPH 
    Shit happens. That was too much for Johnny.
    Johnny never made a ##{i} Training."
    PARAGRAPH
    death
  end   
end