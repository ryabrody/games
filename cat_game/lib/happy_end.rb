class HappyEnd
  include MarkupHelper
  include DeathHelper
  
  GOOD_CHOICE = "bye lovely Johnny"
  BAD_CHOICE = "flee"

  def initialize
    @status = Assets.kuss
  end
  
  def enter
    explain_choices
      loop do
        prompt
        action = gets.chomp
        case action
        when GOOD_CHOICE
          first_choice
          Process.exit(0)
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
    It's morning and you have to bring Johnny back home.
    You had a lot of fun with Johnny and you're really sad to 
    give him back home.
    Now you have the following Choices:
    You can kidnap Johnny, leave the country and beginn a new live.
    When this is what you want type "#{BAD_CHOICE}".
    Or you can be a nice Peson and bring johnny back to my
    grandmother.
    When this is what you want type "#{GOOD_CHOICE}"
    PARAGRAPH
  end
  
  def first_choice
    space
    puts <<-PARAGRAPH
    My Grandmother is verry happy to see Johnny again.
    She gives you a biiiig kiss: 

    PARAGRAPH
    puts @status
    puts "\nWell done!"
    space
    pause
  end
  
  def second_choice
    space
    puts <<-PARAGRAPH
    You take with Johnny the next flight to Columbia.
    Johnny's heartache was big because he still miss his girlfriend. 
    He's heart decided to don't beat anmymore.        
    PARAGRAPH
    death
  end
  def invalid_input
    space
    puts <<-PARAGRAPH
    I know it is a hard decision but you have to make
    a choise between "flee" or "bye lovely Johnny".
    PARAGRAPH
  end
end
