class WashingRoom
  include MarkupHelper
  include DeathHelper
  
  GOOD_CHOICE = "pullover"
  BAD_CHOICE = "birdhouse"
  
  def initialize
    @status = Assets.washing
  end
  
  def enter
    explain_choices
    loop do
      prompt
      action = gets.chomp
      case action
      when GOOD_CHOICE
        fist_choice
        return TrainingRoom
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
    Well, after the hard hunting Johnny is very dirty now.
    He needs a bath. So you go to the bathroom and fill the bath tube with
    Water. Now you have to wait until the tube is full.
    What do you do while you are waiting?
    Do you build a birdhouse for the garden? Then type "#{BAD_CHOICE}".
    Or do you knit up a lovely pullover for your friend? Then type "#{GOOD_CHOICE}".
    PARAGRAPH
  end
  
  def fist_choice
    space
    puts <<-PARAGRAPH
    Oh, Johnny loves wool. While you are knitting up the pullover, 
    Johnny plays with the wool.
    And as soon as the bath tube was full you cleaned up Johhny.

    He looks gorgeous, dosen't he?
    
    PARAGRAPH
    puts @status
    space
    pause
  end
  
  def second_choice
    space
    puts <<-PARAGRAPH
    While you are building your birdhouse in the garden,
    Johnny plays lonely in your flat.
    After you came back from building the birhouse,
    you find Johnny in the bath tube.
    The tube was too full for Johnny.
    PARAGRAPH
    death
  end
  
  def invalid_input
    space
    puts <<-PARAGRAPH
    Please make a decicion between "#{BAD_CHOICE}" and "#{BAD_CHOICE}".
    PARAGRAPH
  end
end
   