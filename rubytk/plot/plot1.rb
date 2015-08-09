require 'tkextlib/tcllib/plotchart'
include Tk::Tcllib::Plotchart
 
Barchart.new(%w(A B C D E), [0, 10, 2], 2, width:400, height:200){
  title "任意のデータ"
  plot('series1', [1, 4, 6, 1, 7], 'red')
  plot('series2', [0, 3, 7, 9, 2], 'green')
  pack
}
 
Tk.mainloop
