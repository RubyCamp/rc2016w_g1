# coding: utf-8
=begin 
達成度計算のためのクラス。
メソッド now は水が落ちたかどうかと現在画面上にいる虫の数を受け取り、達成度を返す
メソッド draw はプラントと達成度を描画する。
=end

class Achieve

  PICSIZE    = 96
  SERIAL     = 10
  PLANTX     = 688
  PLANTY     = 488
  PROGRESS   = 1
  SCORE_COEF = 0.05
  INSECTMAX  = 20
  PARAM = 750 # ゲームバランス調整用
  
  def initialize
    @achieve = 0
    @water = false
    @waterCoef = 0
    @insectCount = 0
    @insectCoef = 0
    @img = Image.load("images/plant.png")
    @x1 = 0
    @y1 = 0
    @slicedImage = 0
    @font = Font.new(32) 
  end

  def update(water, insectCount)
    @water = water
    @insectCount = insectCount

    if @insectCount > INSECTMAX
      @insectCount = INSECTMAX
    end
    
    if @water == true
      @waterCoef = SCORE_COEF
    end

    @insectCoef = @insectCount * SCORE_COEF

    @achieve += PROGRESS + @waterCoef - @insectCoef
  end

  def now
    return @achieve / PARAM
  end

  def draw
    # プラントを表示する
    @x1 = PICSIZE * (@achieve / PARAM * SERIAL).to_i
    @slicedImage = @img.slice(@x1, @y1, PICSIZE, PICSIZE)
    Window.draw(PLANTX, PLANTY, @slicedImage)

    # 値の表示
    Window.draw_font(PLANTX, PLANTY, "#{(@achieve /PARAM * 10).round(1)} \%", @font)
  end   

end
