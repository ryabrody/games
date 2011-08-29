class FeedingRoom
  include MarkupHelper
  include DeathHelper
  
  GOOD_CHOICE = "mouse"
  BAD_CHOICE = "cat food"
  
  def initialize
    @status = Assets.feeding
  end
  
  def enter
    choice_explain
      loop do
        prompt
        action = gets.chomp
        case action
        when GOOD_CHOICE
        first_choice
        return WashingRoom
        when BAD_CHOICE
        second_choice
        else
        invalid_input
      end
    end
  end
  
  private
  def choice_explain
    puts <<-PARAGRAPH
    Ok, It is morning and Johnny is hungry. He needs some food.
    My grandmother gave you some special cat food.
    But it seems that Johnny prefers to eat a mouse.
    What do you do?
    Do you give Johnny the special food from my Grandmother? Then type "#{BAD_CHOICE}".
    Or do you let Johny hunt a wild mouse? Then type "#{GOOD_CHOICE}".
    PARAGRAPH
  end
  
  def first_choice
    space
    puts <<-PARAGRAPH
    Oh, nice decicion. Johnny loves to hunt mouses.
    
    PARAGRAPH
    puts @status
    space
    pause
  end
  
  def second_choice
    space
    puts <<-PARAGRAPH
    Oh man, the food from my grandmother wasn't fresh anymore
    That's maybe the reason why Johnny don't move anymore.
    PARAGRAPH
    death
  end
  
  def invalid_input
    space
    puts <<-PARAGRAPH
    "#{GOOD_CHOICE}" or "#{BAD_CHOICE}" what is so difficult???
    Try it again:
    PARAGRAPH
  end
end
    