# 岡
require 'smalrubot'

require_relative 'wind'
WINDOW_HALF = 400
# ゲージ(レール)のクラス
class Gage < Sprite
	def initialize
		@image = Image.load("images/Gage.png")
		@dx = 3
		@x = 0
		self.x = 0
		self.y = 96
                @wind = Wind.new
	end

	def update
                @wind = Wind.new
		self.x += @wind.getwind
		if(self.x > Window.width)
			self.x = 0
		end
	end

	def draw
		Window.draw(self.x, self.y, @image)
		Window.draw(self.x - Window.width, self.y, @image)
=begin
		Window.draw(@x, self.y, @image)
		Window.draw(self.x, self.y, @image_line)
=end
	end
end