# coding: utf-8
=begin
月に関するクラス。
メソッド update は経過時間を判断し月の状態を更新する。
メソッド now はその時点の月を返す。13は番兵である。
メソッド draw は画面上に月と背景を描写する。
なおdrawは最初に描画するため、他の描写の前に呼ぶこと 
=end
class Month

  MONTH_TIME = 10
  FONT_X = 720
  FONT_Y = 32
  BG_X = 0
  BG_Y = 0
  
  def initialize
    @month = 1
    @sprImg = Image.load("images/spring.png")
    @sumImg = Image.load("images/summer.png")
    @autImg = Image.load("images/autumn.png")
    @winImg = Image.load("images/winter.png")
    @begintime = Time.now
    @font = Font.new(32)
  end

  def update
    @endtime = Time.now

    if @endtime - @begintime >= MONTH_TIME
      @month += 1
      @begintime = Time.now
    end
  end

  def now
    return @month
  end
  
  def draw
    
    if @month <= 2
      Window.draw(BG_X, BG_Y, @winImg)
    elsif @month <= 5
      Window.draw(BG_X, BG_Y, @sprImg)
    elsif @month <= 8
      Window.draw(BG_X, BG_Y, @sumImg)
    elsif @month <= 11
      Window.draw(BG_X, BG_Y, @autImg)
    else
      Window.draw(BG_X, BG_Y, @winImg)
    end
    
    Window.draw_font(FONT_X, FONT_Y, "#{@month}月", @font)
  end
  
end
