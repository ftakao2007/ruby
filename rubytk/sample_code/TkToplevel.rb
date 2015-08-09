require 'tk'

rootwindow = TkRoot.new
rootwindow.title('ルートウィンドウ')

TkLabel.new(rootwindow,
	    text: 'これがルートウィンドウです．').pack

newwindow = TkToplevel.new
newwindow.title('新しいウィンドウ')

TkLabel.new(newwindow,
	    text: 'これが新しいウィンドウです．').pack
TkButton.new(newwindow,
	     text: 'close',
	     command: proc{newwindow.destroy}).pack
Tk.mainloop
