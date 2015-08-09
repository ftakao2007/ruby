require 'tkextlib/tcllib/plotchart'
include  Tk::Tcllib::Plotchart
 
#黒点数の2012年12月から2013年1月までのデータ
SUNSPOT = [40.8, 62.9, 38.1, 57.9, 72.4, 78.7, 52.5, 57.0, 66.0, 36.9, 85.6, 77.6]
 
XYPlot.new([0, 12, 1], [0, 100, 20], width:400, height:200){
  title "2013年の黒点相対数"
  xtext "(月)"
  ytext "黒点数"
  dataconfig('sunspot', color: :red)
  12.times { |m| plot('sunspot', m, SUNSPOT[m]) }
  pack
}
 
Tk.mainloop
