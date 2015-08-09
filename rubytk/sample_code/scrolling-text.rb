require 'tk'
require 'tkafter'

text = '本研究室では自然言語処理を中心とした研究を行っています．たとえば，新聞記事からの情報抽出や，文書要約，ファジー理論を用いた対話型インタフェース，アジア圏言語間における機械翻訳があります．'

canvaswidth = 200
textwidth = text.length * 8 + canvaswidth
limitaverage = Float(textwidth + canvaswidth) / Float(textwidth + canvaswidth * 2)
speed = TkVariable.new('25.0')
pos = 0.0

canvas = TkCanvas.new(nil,
	     'width' => canvaswidth,
	     'height' => 20,
		      'scrollregion' => "-#{canvaswidth} 0 #{textwidth} 20")
canvas.pack

txt = TkcText.new(canvas,
	    0,2,
	    'anchor' => 'nw',
	    'text' => text)

TkLabel.new(nil, 'text' => 'slow').pack('side' => 'left')
scale = TkScale.new(nil,
		    'showvalue' => 'false',
		    'from' => 100.0,
		    'to' => 1.0,
		    'width' => 8,
		    'length' => 120,
		    'orient' => 'horizontal',
		    'resolution' => 0.5,
		    'tickinterval' => 0,
		    'sliderlength' => 16,
		    'variable' => speed)
scale.pack('side' => 'left', 'fill' => 'x', 'expand' => 'yes')
TkLabel.new(nil, 'text' => 'fast').pack('side' => 'left')

TkAfter.new(2, -1,
	    proc{if pos > limitaverage then
		   pos = 0.0
		 else
		   pos += 0.01 / (speed.value).to_f  
		 end;
	      canvas.xview('moveto', pos)}).start
Tk.mainloop
