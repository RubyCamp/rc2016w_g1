# coding: utf-8-with-signature
#永瀬史哉
require_relative 'result'
=begin
	リザルト表示
	result_draw リザルト画面の表示 (経過期間,成長率,虫の数)
=end
class Result < Button_push
	def draw(day , achieve)#経過期間,成長率,出現した虫の数
    @grow = achieve[:achieve]
    @ins  = achieve[:insectCount]

		#ins_n = insect["no"]
		Window.draw(0, 0, @back_image)
		Window.draw(Window.width / 2 + (Window.width / 7), Window.height / 2 + 50,Image.load("../../images/PottedPlant.png"))
		if @grow >= 1
			Window.draw((Window.width / 2) - 300 , Window.height / 2 - (Window.height / 2.5), Image.load("../../images/clear.png"))#resultの文字
			Window.draw(Window.width / 2 + (Window.width / 7), Window.height / 2 - 100,@frower[3])
		elsif day >=13
			Window.draw((Window.width / 2) - 330 , Window.height / 2 - (Window.height / 2.5), Image.load("../../images/false.png"))#resultの文字
			Window.draw(Window.width / 2 + (Window.width / 7), Window.height / 2 - 100,@frower[4])
		else
			Window.draw((Window.width / 2) - (@logo_x / 3) , Window.height / 2 - (Window.height / 2.5), Image.load("../../images/result.png"))#resultの文字
			Window.draw(Window.width / 2 + (Window.width / 7), Window.height / 2- 100,@frower[(@grow * 100 / 25)])
		end
		Window.draw(Window.width / 2 - Window.width / 4 + 30, Window.height / 2 - 30,Image.load("../../images/conp.png"))#見出し1
		Window.draw_font(Window.width / 2 + 70, Window.height / 2, (@grow * 100).to_i.to_s + "％", @font, hash={color: [0, 0, 0]})#値1
		Window.draw(Window.width / 2 - Window.width / 4 + 30, Window.height / 2 + 45,Image.load("../../images/mons.png"))
		Window.draw_font(Window.width / 2 + 70, Window.height / 2 + 75, day.to_s + "ヶ月", @font, hash={color: [0, 0, 0]})#値2
		Window.draw(Window.width / 2 - Window.width / 4 + 30, Window.height / 2 + 120,Image.load("../../images/ins.png"))
		Window.draw_font(Window.width / 2 + 70, Window.height / 2 + 150, @ins.to_s + "匹", @font, hash={color: [0, 0, 0]})#値3
		@time += 1
	end
end
