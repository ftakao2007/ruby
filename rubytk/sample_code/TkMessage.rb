
require 'tk'

string = "昔むかし，おじいさんとおばあさんが住んでいたそうな．\nおじいさんは山へ柴刈に，おばあさんは川で洗濯をしておったそうな．\nある日，おばあさんが川で洗濯をしておったら大きな桃がどんぶらこ，どんぶらこと流れてきたそうな．\n(以下続く)"

label1 = TkMessage.new(nil,
                      text: string,
		      aspect: 200).pack

Tk.mainloop
