require 'tkextlib/tcllib/plotchart'
include Tk::Tcllib::Plotchart
 
[[:yellow,:red],[:green,:darkgreen],[:magenta,:blue]].each{|c|
s = Plot3D.new([0, 10, 3], [-10, 10, 10], [0, 7.5, 2.5],width:500,height:400){
  title "3D Plot"
  grid_size(80,80)
  color(c[0],c[1])
  plot_function{|x,y|
    x1 = x.to_f/9.0
    y1 = y.to_f/9.0
    3.0 * (1.0-(x1*x1+y1*y1))*(1.0-(x1*x1+y1*y1))
  }
}.pack(side: :left)
}
Tk.mainloop
