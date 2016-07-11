# encoding : utf-8
class Flower 

	 FLOWER_X = 272
	 FLOWER_Y = 200
	 POT_X 		= 275
	 POT_Y		= 360

   def initialize
    @seed  = Image.load("images/flower01.png")
    @grass = Image.load("images/flower02.png")
    @bud   = Image.load("images/flower03.png")
    @bloom = Image.load("images/flower04.png")
    @dead  = Image.load("images/flower05.png")
    @plant = Image.load("images/Pottedplant.png")
    @achieve = 0.0
   end

  def draw(achieve)

    @achieve = achieve

    Window.draw(POT_X, POT_Y, @plant)
    
    if @achieve <= 0.25
      Window.draw(FLOWER_X, FLOWER_Y, @seed)
    elsif @achieve <= 0.5
      Window.draw(FLOWER_X, FLOWER_Y, @grass)
    elsif @achieve <= 0.75
      Window.draw(FLOWER_X, FLOWER_Y, @bud)
    else
      Window.draw(FLOWER_X, FLOWER_Y, @bloom)
    end
  
    

  end
end
