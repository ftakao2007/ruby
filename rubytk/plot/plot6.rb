require 'tk'
require 'tkextlib/tcllib/plotchart'
 
#2013年度47都道府県の人口データ
POPULATION = [
["東京都", 13286735],
["神奈川県", 9081742],
#### #### 中略 #### ####
["島根県", 702237],
["鳥取県", 577642]]
 
canvas = TkCanvas.new(:width=>600, :height=>600).pack
 
pie = Tk::Tcllib::Plotchart::Piechart.new(canvas){
 title "都道府県別人口比率(2013)"
}
 
pie.plot(POPULATION)
 
Tk.mainloop
