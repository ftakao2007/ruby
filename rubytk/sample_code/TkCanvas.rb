require 'tk'

canvas = TkCanvas.new(nil,
		      'height' => 400,
		      'width' => 400)
canvas.pack('side' => 'top')

TkcOval.new(canvas,
	    50,50,
	    170,150,
	    'outline' => 'blue',
	    'width' => 5)
TkcArc.new(canvas,
	   70, 300,
	   200, 390,
	   'start' => 90,
	   'extent' => 135,
	   'style' => 'pieslice',
	   'outline' => 'red',
	   'fill' => 'gray25',
	   'width' => 5)
TkcRectangle.new(canvas,
		 240, 40,
		 320, 100,
		 )
TkcPolygon.new(canvas,
	       10,210,
	       100,210,
	       130,250,
	       40, 290,
	       20, 310,
	       'fill' => 'darkgreen',
	       'outline' => 'yellow',
	       'width' => 10)
TkcLine.new(canvas,
	    230, 330,
	    270, 390,
	    320, 300,
	    380, 370,
	    'arrow' => 'both')
TkcText.new(canvas,
	    250,290,
	    'text' => "この様にテキストも\n入力できます.",
	    'fill' => 'red'
	    )
TkcImage.new(canvas,
	     290, 190,
	     'image' => TkPhotoImage.new('file' => '/tmp/hoshiika.jpg'))
TkcWindow.new(canvas,
	      160,190,
	      'window' => TkButton.new(nil, 'text' => 'button',
				       'command' => proc{print "hello world\n"})
	      )
Tk.mainloop
