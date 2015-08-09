require 'tk'

string = 'たとえば，文字列がたくさんあって，
このように1行にはいりきらなければ，
スクロールバーを使用すると効果的です．




改行をたくさんして，
縦方向がいっぱいになっても
自動的に拡張されるので
安心ですね．
以上がスクロールバーの
実例でした．'

frame = TkFrame.new(nil)
xscrollbar = TkScrollbar.new(nil,
			 orient: 'horizontal')
yscrollbar = TkScrollbar.new(frame,
			 orient: 'vertical')
text = TkText.new(frame,
		  wrap: 'none',
		  width: 20,
                  height: 10,
		  xscrollcommand: proc{|idx| xscrollbar.set(*idx)},
		  yscrollcommand: proc{|idx| yscrollbar.set(*idx)})

xscrollbar.command(proc{|idx| text.xview(*idx)})
yscrollbar.command(proc{|idx| text.yview(*idx)})

yscrollbar.pack(side: 'right', fill: 'both')
xscrollbar.pack(side: 'bottom', fill: 'both')
text.pack(side: 'left', fill: 'both', expand: 'yes')
frame.pack(side: 'top', fill: 'both', expand: 'yes')
text.insert('end',string)

Tk.mainloop
