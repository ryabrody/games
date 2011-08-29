class GuestRoom
  include MarkupHelper
  include DeathHelper
  
  GOOD_CHOICE = "allow"
  BAD_CHOICE = "forbid"
  
  def initialize
    @status = Assets.guest
  end
    
  def enter
    explain_choices
    loop do
    prompt
    action = gets.chomp
      case action
      when GOOD_CHOICE
        first_choice
        return SleepingRoom
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
    Well, you are pointly arrived by your Friend.
    You go in and have a duff beer with your Friend.
    Johnny sneaking around your feets and makes some noices
    like: "MIIIIAAAAUUUUUW".
    Johnny is bored and wants to go outside playing.
    Do you allow Johnny to go outside? Then type "#{GOOD_CHOICE}".
    Or do you want to have Johnny by your side beacause of the
    dangers which are outside? Then type "#{BAD_CHOICE}".
    PARAGRAPH
  end
  
  def first_choice
    space
    puts <<-PARAGRAPH
    So you let Johnny go outside for playing.
    After a while you would like to go home and
    search Johnny outside. You found Johnny on a fence
    with a nice cat-ladejh.
    
    PARAGRAPH
    puts @status
    space
    pause
  end
  
  def second_choice
    space
    puts <<-PARAGRAPH
    Poor Johnny. He was so bored, that he can't breath anymore.
    Johnny never plays outside again.
    PARAGRAPH
    death
  end
  
  def invalid_input
    space
    puts <<-PARAGRAPH
    Johnny didn't understand you. Can you repeat your answer?      
    PARAGRAPH
  end
end