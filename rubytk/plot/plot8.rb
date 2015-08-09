require 'tk'
require 'tkextlib/tcllib/plotchart'
 
root = TkRoot.new(:title=>"PLOTCHART_CPU_LOAD_AVERAGE")
 
button_label = TkLabel.new(:text=>"CPU１分平均負荷率", :relief=>:raised, :bg=>:gray94)
button_label.pack(:side=>:bottom, :fill=>:x)
 
canvas = TkCanvas.new(width: 500, height: 200).pack
 
slipchart = Tk::Tcllib::Plotchart::Stripchart.new(canvas, [0.0, 100.0, 10.0], [0.0, 3.0, 0.5])
 
button_label.bind 'Button-1' do
  counter = 0.0 
  TkTimer.start(2000) { #2秒ごとに繰り返す
    _uptime = `uptime`
    #=> " 0:49  up 11:27, 3 users, load averages: 0.96 0.64 0.59\n"
 
    cpu = _uptime[40..44]  #cpu_load_average_1min (%)  
    slipchart.plot('1min', counter, cpu)
    slipchart.dataconfig('1min', :colour=>:green, :filled=>:down, :fillcolour=>:green)
 
    counter += 2.0
  }
end
 
Tk.mainloop
