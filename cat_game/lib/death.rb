class Death
  include MarkupHelper

  def initialize
    @status = Assets.deathpic
  end

  def death
    space
    puts <<-PARAGRAPH
    *** R.I.P Johnny ***
  
    PARAGRAPH
    puts @status
    space
    Process.exit(0)
  end
end
