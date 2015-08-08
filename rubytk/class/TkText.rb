require 'tk'

text = TkText.new(nil)
text.pack('side' => 'top', 'fill' => 'both')
button = TkButton.new(nil, 'text' => 'print', 
		      'command' => proc{print text.value, "\n"})
button.pack('side' => 'left', 'fill' => 'both')

quitbutton = TkButton.new(nil, 'text' => 'quit',
		  'command' => proc{exit})
quitbutton.pack('side' => 'right', 'fill' => 'both')

Tk.mainloop
