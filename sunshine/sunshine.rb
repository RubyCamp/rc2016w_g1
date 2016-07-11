# coding: utf-8
=begin
太陽に関するクラスである。
メソッド update はセンサの状態を読取り、認知回数を更新する。
メソッド statue は指定の値を超えた時 true を返し、認知回数を初期化する。
メソッド draw は太陽を描写する。 
=end

class Sunshine

  SENSER_MAX = 420
  SENSER_UPPER = 300
  SENSER_DOWNER = 225
  SLEEP_TIME = 0.0
  RECOG_COUNT = 25 # ゲームバランス調整可能
  SUN_X = 336
  SUN_Y = -16
  AVERAGE_COUNT = 10
  WAIT_TIME = 5
  
  def initialize
    @senser = 0
    @senserMax = 0
    @fineSun =  Image.load("../images/fine_sun.png")
    @shineSun = Image.load("../images/shine_sun.png")
    @darkSun =  Image.load("../images/dark_sun.png")
    @count = 0
    @calibSum = 0
    @senserUpper = SENSER_UPPER
    @senserDowner = SENSER_DOWNER
  end

  def setup
    puts "#{WAIT_TIME}秒後にキャリブレーションを行います."
    puts "センサを明るい場所に移動してください."
    
    WAIT_TIME.downto(0) do |i|
      print i, " "
      sleep 1
    end

    puts "Calib Start!"
    
    AVERAGE_COUNT.times do
      puts $board.analog_read(0)
      @calibSum += $board.analog_read(0)
    end

    @senserMax = @calibSum / AVERAGE_COUNT

    @senserUpper  = @senserMax - (SENSER_MAX - SENSER_UPPER)
    @senserDowner = @senserMax - (SENSER_MAX - SENSER_DOWNER)
    if @senserUpper > 0 && @senserDowner > 0
      puts "Calib Complete."
    else
      @senserUpper  = SENSER_UPPER
      @senserDowner = SENSER_DOWNER
      puts "Calib Failed(Too Dark)."
    end
  end
  
  def update
    @senser = $board.analog_read(0)

    if @senser >= @senserDowner && @senser <= senserUpper
        @count += 1
    end

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
    if @senser >= @senserDowner
      if @senser <= @senserUpper
        Window.draw(SUN_X, SUN_Y, @fineSun)
      else
        Window.draw(SUN_X, SUN_Y, @shineSun)
      end
    else
      Window.draw(SUN_X, SUN_Y, @darkSun)
    end
  end

end

sunshine = Sunshine.new
sunshine.setup

Window.loop do
  sunshine.update
  sunshine.draw
end
