# coding: utf-8
=begin
虫に関するクラス。
メソッド update はクラス Sunshine.statueの値とセンサの状態を読取り、虫の状態を更新する。
メソッド statue は0-20のセンサ振動回数を返す。
メソッド count は いままでの虫の総数を返す。 
メソッド draw は虫の描画を行う。
グローバル変数$boardを定義する必要がある。
=end

class Insect

  SHAKEMX = 10
  PICSIZE = 256
  PLANTX  = 272
  PLANTY  = 200
  SLEEP_TIME = 0.025
  
  def initialize
    @img = Image.load("images/insect.png")
    @beforeValue = $board.digital_read(2)
    @insectPos = Array.new
    @count = 0
    @sum = 0
    @sunshine = false
  end

  def update(sunshine)
    # センサを所定回数検知すると虫を増やす
    if @beforeValue != $board.digital_read(2)
      @count += 1
      @sum += 1
    end
    
    if @count >= SHAKEMX
      @insectPos.unshift([PLANTX + rand(PICSIZE), PLANTY + rand(PICSIZE)])
     @count = 0
    end

    @beforeValue = $board.digital_read(2)

    @sunshine = sunshine

    sleep SLEEP_TIME

    if @sunshine == true
      @insectPos.shift
    end

  end

  def statue
    return @count
  end

  def count
    return @sum
  end
  
  def draw
    @insectPos.each do |array|
      Window.draw(array[0], array[1], @img)
    end
  end

end
