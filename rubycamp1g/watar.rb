# 岡
require 'smalrubot'
require_relative 'wind'

ARROW_SIZE = 16
# 水やりのクラス
# 引数 x = -70, y = 100(流れてくるy座標)
class Watar < Sprite
  def initialize(x, y)
    
    @image = Image.load("images/Water.png")
    @image_arrow = Image.load("images/Arrow.png")
    @image_arrow.set_color_key([0, 0, 0])
  	@x = x
    @y = y
    @dx = 3
  	@dy = 5
  	@flag = false
    @wind = Wind.new
    super
  end

  def update
   @wind = Wind.new
  	if (@flag == false)
  	  self.x += @wind.getwind
  	elsif (@flag == true)
  	  self.y += @dy
  	end
    button = $board.digital_read(3)
    if (button == 1)
      @flag = true
    end
    if (self.y > Window.height / 2)
      self.x = @x
      self.y = @y
      @flag = false
      
    end
    if (self.x > Window.width )
      self.x = @x
      self.y = @y
      @flag = false
    end
  end

  def statue
    if (self.x > Window.width - 50 && self.x < Window.width + 50 && self.y == Window.height / 2)
      return true
    else
      return false
    end
  end

  def draw
  	Window.draw(self.x, self.y, @image)
    Window.draw(Window.width / 2 - 50 - ARROW_SIZE, @y - 30, @image_arrow)
    Window.draw(Window.width / 2 + 50 - ARROW_SIZE, @y - 30, @image_arrow) 
  end
end