require 'dxruby'
=begin
永瀬史哉
BGM
SE
配列で管理
playの引数に配列の添え字
=end

class Play_BGM
	def initialize#BGMを登録する .
		@bgm = Array.new
		@bgm[0] = Sound.new("sound/main_bgm.mid")
		@bgm[1] = Sound.new("sound/title.mid")
		@bgm[3] = Sound.new("sound/result.mid")
		@bgm[4] = Sound.new("sound/old_frower.mid")

		@play_naw = nil

	end

	def play(no)#再生したい添字
		@bgm[no].play
		@play_naw = no
	end

	def stop_bgm
		if @play_naw != nil
			@bgm[@play_naw].stop
		end
	end

	def resource_dispose
		@bgm.each do |i|
			i.dispose
		end
	end

	def bgm_set_volume(val)
		@bgm.each do |i|
			i.dispose
		end
	end
end

class Play_se
	def initialize#SEを登録する .wav
		@se = Array.new
		@se[0] = Sound.new("sound/cancel5.wav")
		@se[1] = Sound.new("sound/correct2.wav")
		@se[2] = Sound.new("sound/cursor2.wav")
		@se[3] = Sound.new("sound/a_bag_in_a_car.wav")#ジョウロが入ったとき
		@se[4] = Sound.new("sound/blip01.wav")#ジョウロが外れたとき
		@se[5] = Sound.new("sound/poka03.wav")#ボタンが押されたとき
		@se[6] = Sound.new("sound/powerdown02.wav")#虫
		@se[6] = Sound.new("sound/shock1.wav")#かれたとき
	end

	def play(no)#再生したい添字
		@se[no].play
	end

	def resource_dispose
		@se.each do |i|
			i.dispose
		end
	end

	def se_set_volume(val)
		@se.each do |i|
			i.set_volume(val)
		end
	end
end

