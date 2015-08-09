require 'tk'

root = TkRoot.new

var = TkVariable.new('bindtest')
label = TkLabel.new(root, textvariable: var).pack(fill: 'both')
TkMessage.new(root,
	      width: 150,
	      text: 'このウィンドウの上にカーソルを当ててクリックやキーにタッチすると，いろいろなことが起こりそうです．').pack

TkButton.new(root,
	     text: 'quit',
	     command: proc{exit}).pack
root.bind('Button-1', proc{label.background('blue')})
root.bind('ButtonRelease-1', proc{label.background('gray85')})
root.bind('Button-2', proc{label.background('green')})
root.bind('ButtonRelease-2', proc{label.background('gray85')})
root.bind('Button-3', proc{label.background('red')})
root.bind('ButtonRelease-3', proc{label.background('gray85')})
root.bind('Double-1', proc{label.background('gold')})
root.bind('Double-2', proc{label.background('purple')})
root.bind('Double-3', proc{label.background('white')})
root.bind('Enter', proc{var.value = 'test!'})
root.bind('Leave', proc{var.value = 'test'})
root.bind('Key', proc{|k| var.value = "You pressed \"#{k}\"."}, "%K")
Tk.mainloop
