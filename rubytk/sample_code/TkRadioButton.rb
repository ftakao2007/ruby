require 'tk'

var = TkVariable.new('red')
TkRadioButton.new(nil, 
		  text: '赤',
		  value: 'red',
		  variable: var).pack
TkRadioButton.new(nil, 
		  text: '緑',
		  value: 'green',
		  variable: var).pack
TkRadioButton.new(nil, 
		  text: '青',
		  value: 'blue',
		  variable: var).pack
w = TkButton.new(nil,
                 text: 'ボタン色変更',
                 command: proc{ w.background(var.value); w.activebackground(var.value)})
w.pack
TkButton.new(nil,
             text: 'quit',
             command: proc{ exit }).pack

Tk.mainloop
