require 'tk'

frame1 = TkFrame.new(nil).pack('side' => 'left')
frame2 = TkFrame.new(nil).pack('side' => 'right')

TkLabel.new(frame1,
            text: '左上', 
            relief: 'raised').pack
TkLabel.new(frame2,
            text: '右上', 
            relief: 'raised').pack
TkLabel.new(frame1,
            text: '左下', 
            relief: 'raised').pack
TkLabel.new(frame2,
            text: '右下', 
            relief: 'raised').pack

Tk.mainloop
