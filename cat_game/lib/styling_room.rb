class StylingRoom
  include MarkupHelper
  include DeathHelper
  
  GOOD_CHOICE = "dry"
  BAD_CHOICE = "wet"
  
  def initialize
    @status = Assets.styling
  end
    
  def enter
    explain_choices
    loop do
      prompt
      action = gets.chomp
      case action
      when GOOD_CHOICE
        first_choice
        return GuestRoom
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
    After the Training, Johnny doesn't look very nice.
    You would like to visit some friends. And because of that
    you have to pimp up Johnny for the visit.
    You wash Johnny again.
    Now it's two o'clock in the afternoon and you have to hurry up.
    Johnny is still wet. So what do you gonna do?
    Do you go out with Johnny while he is still wet? Then type "#{BAD_CHOICE}".
    Or do you blow Johhny dry with the hairdryer? Then type "#{GOOD_CHOICE}".  
    PARAGRAPH
  end
  
  def first_choice
    space
    puts <<-PARAGRAPH
    Well done, Johnny looks sooooouuuw sweeet <3 <3
    Doesn't he?
    
    PARAGRAPH
    puts @status
    space
    pause
  end
  
  def second_choice
    space
    puts <<-PARAGRAPH
    Oh, no ! It was too cold for Johnny outside.
    He is frozen and never mets your Friend.      
    PARAGRAPH
    death
  end
  
  def invalid_input
    space
    puts <<-PARAGRAPH
    The fucking question was "dry" or "wet" so type "dry" or "wet" and nothing other !!!
    Remember you have to hurry up !!!
    PARAGRAPH
  end
end
