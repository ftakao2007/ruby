require 'tk'

var = TkVariable.new('')

TkCheckButton.new(nil, 
	       text: '「太郎」を付け足す',
	       onvalue: '太郎',
	       offvalue: '',
	       variable: var).pack

TkButton.new(nil,
             text: 'My name',
             command: proc{print "山田" + var.value + "です．\n"}).pack

TkButton.new(nil,
             text: 'quit',
             command: proc{ exit }).pack

Tk.mainloop
