###Minamirb + axlsx###
このアプリケーションでaxlsxをハッキングします。わずか数行のコードでECMA-376に準拠したファイルを提供できるようにします。

repoをフォークし、クローンしましょう
https://github.com/randym/minamirb/fork_select

    $ git clone git@github.com:[your_account_name]/minamirb

基本セットアプしましょう
```shell
    $ cd minamirb
    $ bundle install
    $ bundle exec rake db:setup
    $ bundle exec rake minamirb:random_data count=10
    $ rails server
```
後は会場で一緒にコーディングしましょう
どうしても先にやってみたい方のため、[超秘密カンニング資料](http://minamirb-axlsx.herokuapp.com/himitsu.html)をのぞいてみたは？

実際動いているウェブアプリみたいならば[minamirb-axlsx](http://minamirb-axles.herokuapp.com)へアクセス


randym 2012


