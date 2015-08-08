require 'tk'

frame = TkFrame.new(nil).pack
scrollbar = TkScrollbar.new(frame)

listbox = TkListbox.new(frame,
			height: 8,
			width: 20,
			selectmode: 'multiple',
			yscrollcommand: proc{|first, last|scrollbar.set(first, last)}).pack(side: 'left', fill: 'both')

scrollbar.command(proc{|first,last| listbox.yview(first,last)}).pack(side: 'right', fill: 'y')

arr = (['Japan','Korea','North Korea', 'China', 'Taiwan', 'Mongolia', 'Indonesia', 'Singapore', 'Philippinines', 'Thailand', 'Viet Nam', 'Cambodia', 'Lao\'s Republic', 'Malaysia', 'Myanmar', 'Brunei Darussalam']).sort
listbox.insert('end', *arr)

TkButton.new(nil,
	     text: 'print',
             command: proc{(listbox.curselection).each{|i| print arr[i], "\n"}}).pack

Tk.mainloop
