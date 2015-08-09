require 'tkextlib/tcllib/plotchart'
include Tk::Tcllib::Plotchart
 
Barchart.new([*'A'..'J'], [0,10,2], 10, width:800, height:120){
  title "任意のデータ"
  %w(red orange yellow green darkgreen skyblue blue purple black white).each{|c|
    plot(c, Array.new(10){rand 11}, c)
  }
}.pack
 
Tk.mainloop
