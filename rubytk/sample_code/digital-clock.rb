require 'tk'
require 'tkafter'

var = TkVariable.new('')
TkLabel.new(nil,
	    textvariable: var).pack
TkAfter.new(200, -1,
	    proc{var.value = Time.new}).start
Tk.mainloop
