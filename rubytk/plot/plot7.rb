require 'tkextlib/tcllib/plotchart'
include Tk::Tcllib::Plotchart
 
data = Hash.new{|hash,key| hash[key]=Array.new(20){rand 100}}
 
Boxplot.new([0,100,10],[*'a'..'z'],width:600,height:400){
  [*'a'..'z'].each { |t| plot(t, data[t]) }
  title "とあるボックスプロット"
}.pack
 
Tk.mainloop
