# 岡
require 'smalrubot'
require_relative 'wind'
require_relative 'sound'

ARROW_SIZE = 16
WATER_X = -32
WATER_Y = 128

# 水やりのクラス
# 引数 x = -70, y = 100(流れてくるy座標)
class Watar < Sprite
  def initialize
    
    @image = Image.load("../../images/Water.png")
    @image_arrow = Image.load("../../images/Arrow.png")
    @image_arrow.set_color_key([0, 0, 0])
    @x =  WATER_X
    @y =  WATER_Y
    @dy = 5
    @flag = false
    @wind = Wind.new
    @se = Play_se.new
    super
  end

  def update
   @wind = Wind.new
  	if (@flag == false)
  	 @x += @wind.getwind
  	elsif (@flag == true)
  	 @y += @dy
  	end
    button = $board.digital_read(6)
    if (button == 1)
      @flag = true
    end
    if (@y > Window.height / 2)
      @x = WATER_X
     @y = WATER_Y
      @flag = false

    end
    if (@x > Window.width )
      @x = WATER_X
      @y = WATER_Y
      @flag = false
    end
  end

  def statue
    if (@x >= Window.width / 2 - 50 && @x <= Window.width / 2 + 50 && @y >= Window.height / 2 -@dy )
      @se.play(0)
      return true
    elsif (@y >= Window.height / 2 - @dy)
      @se.play(1)
      return false
    else
      return false
    end
  end

  def draw
    Window.draw(@x, @y, @image)
    Window.draw(Window.width / 2 - 50 - ARROW_SIZE, WATER_Y - 30, @image_arrow)
    Window.draw(Window.width / 2 + 50 - ARROW_SIZE, WATER_Y - 30, @image_arrow) 
  end
end