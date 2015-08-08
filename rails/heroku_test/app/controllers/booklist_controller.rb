# coding: utf-8

class BooklistController < ApplicationController

  ### データベースのデータを取得
  def hello
    @titles = Title.all
  end

  ### 変数でのデータの受け渡し
  #def hello
  #  @msg = 'こんにちは、おひさしぶりです';
  #end

  ### app/views/booklist/hello.html.erb を表示
  #def hello
  #end

  ### コントローラから直接出力
  #def hello
  #  render :text => 'Hello!'
  #end

  def bye
    render :text => 'bye!'
  end

end
