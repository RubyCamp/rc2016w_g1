require "smalrubot"

#風のクラス

class Wind
  FLGX = 16
  FLGY = 32

  
  LOW_FLG = 200
  HIGH_FLG = 400
  VERYHIGH_FLG = 550
  FLG_PICSIZE = 64

  def initialize
    @bg_img = Image.load("images/Flg.png")
    @x = FLGX
    @y = FLGY
    @pow = LOW_FLG
    @pic_x = 0
    @img = 0
    @wing = $board.analog_read(4)
 
  end

  def update
    
    @wing = $board.analog_read(4)
    
    if(@wing >= VERYHIGH_FLG)
     @pic_x = FLG_PICSIZE * 3
     @wing = VERYHIGH_FLG   
    elsif(@wing >= HIGH_FLG)
     @pic_x = FLG_PICSIZE * 2
     @wing = HIGH_FLG
    elsif(@wing >= LOW_FLG)
     @pic_x = FLG_PICSIZE
     @wing = LOW_FLG + 100
   elsif (@wing < LOW_FLG)
      @pic_x = 0
      @wing = LOW_FLG + 50

    end 

  end

  def draw
    @img = @bg_img.slice( @pic_x , 0 , FLG_PICSIZE , FLG_PICSIZE )
    Window.draw(@x,@y, @img)
  end

  def getwind
    return @wing / 10.0
  end

   
end