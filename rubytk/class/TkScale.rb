require 'tk'

var = TkVariable.new('50')
scale = TkScale.new(nil,
		    showvalue: 'true',
		    from: 50,
		    to: 100,
		    orient: 'horizontal',
		    length: 250,
		    tickinterval: 10,
		    variable: var).pack

Tk.mainloop
