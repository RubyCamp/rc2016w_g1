require 'dxruby'
require 'smalrubot'
require_relative 'achieve'
require_relative 'finish'
require_relative 'flower'
require_relative 'insect'
require_relative 'month'
require_relative 'sunshine'
require_relative 'water'
require_relative 'gage'
require_relative 'wind'


$board = Smalrubot::Board.new(Smalrubot::TxRx::Serial.new)

Window.width = 800
Window.height = 600

month = Month.new
wind = Wind.new
gage = Gage.new
water = Water.new
achieve = Achieve.new
finish = Finish.new
flower = Flower.new
insect = Insect.new
sunshine = Sunshine.new

Window.loop do
  month.draw
  insect.update(sunshine.statue)
  sunshine.update
  achieve.update(true, insect.statue)
  
  insect.draw
  p achieve.now
  flower.draw(achieve.now)
  sunshine.draw

  achieve.draw

  month.update
end
