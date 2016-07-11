# coding: utf-8
=begin
太陽に関するクラスである。
メソッド update はセンサの状態を読取り、認知回数を更新する。
メソッド statue は指定の値を超えた時 true を返し、認知回数を初期化する。
メソッド draw は太陽を描写する。 
=end

class Sunshine

  SENSER_UPPER = 300
  SENSER_DOWNER = 225
  SLEEP_TIME = 0.1
  RECOG_COUNT = 100 # ゲームバランス調整可能
  SUN_X = 352
  SUN_Y = -16
  
  def initialize
    @senser = 0
    @fineSun =  Image.load("images/fine_sun.png")
    @shineSun = Image.load("images/shine_sun.png")
    @darkSun =  Image.load("images/dark_sun.png")
    @count = 0
  end

  def update
    @senser = $board.analog_read(0)

    if @senser >= SENSER_DOWNER && @senser <= SENSER_UPPER
        @count += 1
    end

    sleep SLEEP_TIME

  end

  def statue
    # パラメータ設定の必要あり
    if @count >= RECOG_COUNT
      @count = 0
      return true
    else
      return false
    end
  end

  def draw
    if @senser >= SENSER_DOWNER
      if @senser <= SENSER_UPPER
        Window.draw(SUN_X, SUN_Y, @fineSun)
      else
        Window.draw(SUN_X, SUN_Y, @shineSun)
      end
    else
      Window.draw(SUN_X, SUN_Y, @darkSun)
    end
  end

end

