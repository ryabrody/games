class FirstRoom
  include MarkupHelper
  include DeathHelper
  
  GOOD_CHOICE = "Hello lovely Johnny"

  def initialize
    @state = Assets.cat
  end
  
  def enter
    explain_choices
    loop do
      prompt
      action = gets.chomp
      case action
      when GOOD_CHOICE
        first_choice
        return FeedingRoom
      else 
        invalid_input
      end
    end
  end
    
  private
  def explain_choices
    space
    puts "**** WELCOME ****"
    puts "Let me introduce you to the cat of my grandmother:"
    space
    puts @state
    space
    puts <<-PARAGRAPH
    It is a "he" and it\'s name is "Johnny".
    Johnny is the one and only for my grandmother. Today you are the nanny for Johnny.
    The only thing you have to do is bringing Johnny healthy back to my grandmother.
    If you are allergic against cats then press "Ctrl + C" to end.
    If you are ready for a day with lovely Johnny type: "#{GOOD_CHOICE}".
    PARAGRAPH
  end
  
  def first_choice
    space
    puts <<-PARAGRAPH
    Well, i like your decicion.
    let us go on.
    PARAGRAPH
    space
    pause
  end
  
  def invalid_input
    space
    puts <<-PARAGRAPH
    I dont understand you.
    Try it again. Good luck!
    PARAGRAPH
  end
end

  