class SleepingRoom
  include MarkupHelper
  include DeathHelper
  
  GOOD_CHOICE = "yes"
  BAD_CHOICE = "no"
  
  def initialize
    @status = Assets.sleeping 
  end
  
  def enter
    explain_choices    
    loop do
      prompt
      action = gets.chomp
      case action
      when GOOD_CHOICE
        first_choice
        return HappyEnd
      when BAD_CHOICE
        second_choice
      else
        invalid_input
      end
    end
  end
  
  private
  def explain_choices
    puts <<-PARAGRAPH
    After Johnny said good bye to his new girlfriend.
    You and Johnny went home. It was late now.
    Johnny's heart is broken because he misses his new girfriend.
    Because of that Johnny would like to sleep outside.
    Do you allow Johnny to sleep outside? Then type "#{GOOD_CHOICE}".
    Do you don't allow Johnny to sleep outside? Then type "#{BAD_CHOICE}".
    PARAGRAPH
  end
  
  def first_choice
    space
    puts <<-PARAGRAPH
    Johnny is outside but he can't sleep.
    He's starring at the moon and thinking about he's new
    girlfriend.
    
    PARAGRAPH
    puts @status
    puts <<-PARAGRAPH
    
    He said to himself "I know she's too starring at te moon and misses me."
    And with this mind he sleeps good this night. 
    PARAGRAPH
    space
    pause
  end
  
  def second_choice
    space
    puts <<-PARAGRAPH
    This was the last night for Johnny.
    He's heart hurt so much that Johnny decied
    to never wake up again.      
    PARAGRAPH
    death
  end
  
  def invalid_input
    space
    puts <<-PARAGRAPH
    
    Please make a decision between
    "yes" or "no".

    If you choose "yes" please push on your keyboard:
    "Y" then "E" then "S" and finally "ENTER"

    If you choose "no" please push on your keyboard:
    "N" then "O" (That's not a number!) and finally "ENTER"

    If you're not able to make that. Please push on your keyboard:
    "Ctrl" + "C"
    After that go out and play in the sandpit. Have fun!      
    PARAGRAPH
  end
end