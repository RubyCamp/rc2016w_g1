# coding: utf-8
=begin 
終了判定のためのクラス。
メソッド ending は現在の月と成長度を引数として受け取り終了なら true を返す
メソッド result は虫の総数を引数として受け取り、ハッシュ関数として結果を返す。
キーと値は次のように定義される。
:winner      : 勝者を String で返す
:achieve     : 成長度を Float で返す
:insectCount : 虫の総数を Fixnum で返す
=end

class Finish

  MONTH_FLAG = 13
  ACHIEVEMAX = 100
  
  def initialize
    @month = 0
    @achieve = 0
    @winner = 0
    @result = Hash.new
  end

  def ending(month, achieve)
    @month = month
    @achieve = achieve
    
    if @month == MONTH_FLAG
      @winner = "Enemy"
      return true
    end
    
    if @month >= ACHIEVEMAX
      @winner = "Player"
      return true
    end

    return false
  end

  def result(insectCount)
    @insectCount = insectCount
    @result = {:winner => @winner, :achieve => @achieve, :insectCount => @insectCount}
    return @result
   end
  
end
