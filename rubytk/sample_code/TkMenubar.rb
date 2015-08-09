require 'tk'

var = TkVariable.new('')
bgcolor = TkVariable.new('darkgreen')
fgcolor = TkVariable.new('white')

frame = TkFrame.new(nil)
frame.pack(side: 'top', fill: 'x')

menubutton = TkMenubutton.new(frame,
			  text: 'menu')

label = TkLabel.new(nil,
		    width: 15,
		    height: 10,
		    background: 'darkgreen',
		    foreground: 'white',
		    textvariable: var)

menu = TkMenu.new(menubutton,
		   tearoff: 'off')

menu.add('command',
	 label: '春',
	 command: proc{var.value = 'あけぼの'})
menu.add('command',
	 label: '夏',
	 command: proc{var.value = 'よる'})
menu.add('command',
	 label: '秋',
	 command: proc{var.value = 'ゆふぐれ'})
menu.add('command',
	 label: '冬',
	 command: proc{var.value = 'つとめて'})
menu.add('separator')

submenu = TkMenu.new(menubutton,
		     tearoff: 'off')
submenu.add('checkbutton',
	    label: '背景色を青にする',
	    onvalue: 'blue',
	    offvalue: 'darkgreen',
	    variable: bgcolor,
	    command: proc{label.background(bgcolor.value)})

submenu.add('separator')

submenu.add('radiobutton',
	    label: '前景色を黄色にする',
	    value: 'yellow',
	    variable: fgcolor,
	    command: proc{label.foreground(fgcolor.value)})

submenu.add('radiobutton',
	    label: '前景色を白色にする',
	    value: 'white',
	    variable: fgcolor,
	    command: proc{label.foreground(fgcolor.value)})

menu.add('cascade',
	 label: 'サブメニュー',
	 menu: submenu)
menu.add('separator')
menu.add('command',
	 label: 'Quit',
	 command: proc{exit})
menubutton.menu(menu)

menubutton.pack(side: 'left')
label.pack(side: 'top', fill: 'both')

Tk.mainloop
