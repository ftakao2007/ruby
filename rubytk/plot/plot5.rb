require 'tk'
require 'tkextlib/tcllib/plotchart'
 
include Tk::Tcllib::Plotchart
 
p = XYPlot.new([0, 100000, 20000],[0, 2000, 400],height:800,width:800){
  title "自治体の人口と出生率"
  xtext "15-64歳 人口 (人)"
  ytext "出生数 (人)"
  dotconfig('series1', color: :green)
  pack
}
 
#ドット打ち
DATA.each do |population, birth|
  p.dot('series1', population, birth, (population/10000.0))
end
 
Tk.mainloop
