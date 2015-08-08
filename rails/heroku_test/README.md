# rails_test
## 内容

herokuにアップしてRailsの挙動を確認するためのもの。

## heroku操作

### deploy
```
git push heroku master
```
※ deployするまえにbundle installとかも実行していたほうがいいかな。

### heroku再起動
データベース定義が新しく追加された場合はマイグレーションを実施
```
heroku run rake db:migrate --app [APP_NAME]
heroku restart --app [APP_NAME] 
```

### WEBページを開く
```
heroku open --app [APP_NAME]
```

### 各種確認
ログ
```
heroku logs -t  --app [APP_NAME]
```

環境変数
```
heroku config
```

環境変数の追加
```
heroku config:add [CONFIG_NAME] =[CONFIG_VALUE] --app [APP_NAME]
```

## 参考リンク
[初心者でも分かるRailsで始めるHeroku入門 その1](http://tech.gmo-media.jp/post/42344727734/starting-rails-on-heroku-01)

## 更新履歴
### master
```
* master

commit e2b4a5d3ba41984dc97f79520396ec997de67007
Author: ftakao2007 <ftakao2007@gmail.com>
Date:   Fri Oct 11 10:06:40 2013 +0900

    edit README.md
```

### [コントローラとアクションの作成とルーティングの設定](http://www.rubylife.jp/rails/ini/index4.html)
```
* master

commit a646c0555f767d6c054065528e64e003a8c70704
Author: ftakao2007 <ftakao2007@gmail.com>
Date:   Fri Oct 11 10:36:53 2013 +0900

    http://www.rubylife.jp/rails/ini/index4.html
```

### [ビューの作成とデータの受け渡し](http://www.rubylife.jp/rails/ini/index5.html)
```
* master

commit 0421cd925efc2f44232aaed7eeb6d4736baeaee0
Author: ftakao2007 <ftakao2007@gmail.com>
Date:   Fri Oct 11 10:56:39 2013 +0900

    http://www.rubylife.jp/rails/ini/index5.html
```

### [モデルの作成とデータベースの利用](http://www.rubylife.jp/rails/ini/index6.html)
```
* master

commit 4a472a6c024f6d0ef7df4affdef97f3cfe672c5c
Author: ftakao2007 <ftakao2007@gmail.com>
Date:   Fri Oct 11 12:18:44 2013 +0900

    heroku run rake db:seed http://qiita.com/quattro_4/items/a2eb3618207e21ca00d3
```


#### モデルの作成とDB関連操作
モデル作成
```
rails generate model title
```
※ 引数にフィールド名とデータ型を指定すると、自動的にマイグレーションファイルが作成される。今回は引数なし  
※ これで「title」モデルが作成される。データベース名にあたる。  

以下ファイルを編集
```
* db/migrate/20131011020349_create_titles.rb
---
class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|

      t.string :name       ※追加
      t.date :sales_date   ※追加

      t.timestamps
    end
  end
end
---
```

```
> rake db:migrate
```
マイグレーションスクリプトを実行。  
「Title」モデル(データベース)に「titles」テーブルを作成する。  
「name」カラムと「sales_date」カラムを持つ。

```
* app/models/title.rb
---
class Title < ActiveRecord::Base
  attr_accessible :name, :sales_date  ※追加
end
---
```
モデルで変数を宣言する。変数名はテーブルのカラムの名前とあわせる。


```
* db/seeds.rb
---
# coding: utf-8

Title.create(:name => '宇宙に行った日', :sales_date => '2011-06-28')  ※追加
Title.create(:name => '観察日記', :sales_date => '2011-11-14')        ※追加
---
```
seeds.rbを使ってテーブルにデータを登録する。

```
> rake db:seed
```
これでテーブルにデータが登録される。

```
fukui-no-MacBook-Air:books-ftakao2007 ftakao2007$ rails dbconsole
SQLite version 3.7.7 2011-06-25 16:35:41
Enter ".help" for instructions
Enter SQL statements terminated with a ";"

sqlite> select * from titles;
1|宇宙に行った日|2011-06-28|2013-10-11 02:15:11.055209|2013-10-11 02:15:11.055209
2|観察日記|2011-11-14|2013-10-11 02:15:11.066997|2013-10-11 02:15:11.066997

sqlite> .quit
```
データが登録されているのが確認できた。

#### herokuでのDB利用
[database.ymlの編集](http://d.hatena.ne.jp/nshibazaki/20110730/1312016837)  
```
heroku config
-> "postgres://username:password@hostname/database"

production: 
  encoding: unicode
  adapter: postgresql
  username: username
  port: 5432
  host: hostname
  database: database
  password: password
```

[heroku側の設定反映](http://qiita.com/quattro_4/items/a2eb3618207e21ca00d3)
```
git .
git commit -m "hoge"
git push heroku master
heroku run rake db:migrate
heroku run rake db:seed   ※これやらないとテーブルが空なので何も表示されなかった。
```


ftakao2007 Copyright (c) 2013  
https://github.com/ftakao2007/rails_test
