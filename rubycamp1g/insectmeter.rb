# coding: utf-8
 
class InsectMeter  
	
	PICSIZE = 96
	INSECTMETER_X = 16
	INSECTMETER_Y = 488
	
	def initialize
		@img = Image.load("images/insectgauge.png")
		@count = 0 
		@rate = 0
		@x1, @y1 = 0, 0
		@x2, @y2 = 0, 0
	end 
	
	def draw(count) 
		@count = count
		@rate = (@count / 2).to_i
		@x1 = PICSIZE * @rate
		@y1 = 0
		@x2 = PICSIZE + PICSIZE *@rate
		@y2 = PICSIZE
		
		
		@image = @img.slice(@x1, @y1, PICSIZE, PICSIZE)
		Window.draw(INSECTMETER_X,INSECTMETER_Y,@image)
	end

end     


