# Ebisu
Short description and motivation.

## Usage
How to use my plugin.

## Installation
### 0. requirements
```
gem 'devise'

Userモデルがあることを前提にしているためUserがない場合
rails g devise User
```

### 1. install
Add this line to your application's Gemfile:

```ruby
gem 'ebisu'
```

And then execute:
```bash
$ bundle
```

### 2. install migrations
```
bundle exec rails ebisu:install:migrations
bundle exec rails db:migrate
```

### 3. Add routing
```
mount Ebisu::Engine => '/'
localhost:3000/articles
に記事の一覧が表示出来るようになる
```

### 4. add role to User
```
rails c
$ user = User.create(~~~~~~)
$ user.add_role(:admin)
localhost:3000/ebisu_admin
に管理画面が表示出来る

第三者に記事用アカウントを発行する場合は
$ user.add_role(:writer)
localhost:3000/ebisu_admin
にアクセスで違う管理画面が表示出来る
```

### 5. ロゴの設定
```
assets内のロゴの名前の
logo.pngにするか

またはinitializerにebisu.rbのロゴをを作成する
https://github.com/NextShip/ebisu/blob/master/config/initializers/ebisu.rb

Ebisu.configure do |config|
  config.logo_url = 'https://ebisu.ico/NextShip/ebisu.png'
end
```


## Contributing
Contribution directions go here.

## How to Update Ebisu
ebisuのversionを上げる手順
```
1. ebisu側でebisuのversionを上げる(lib/ebisu/version.rb)
2. bundle update ebisu
またはGemfileでebisuのversion指定

(migrationファイルがある場合)
3. bundle exec rails ebisu:install:migrations 

4. bundle exec rake db:migrate
5. commitしてpush
```

## Ebisu Breadcrumbs
各記事・カテゴリのパンくずは `breadcrumbs_on_rails` というgemで管理されている。
ebisuの各viewを上書きした場合以下の行を書くことでebisuのcontrollerが生成したパンくずを表示できる。
```
= render_breadcrumbs builder: Ebisu::BreadcrumbsBuilder
```
また、このとき `views/shared/ebisu/breadcrumbs` を使用する。（詳細は[こちら](https://github.com/weppos/breadcrumbs_on_rails)を参照）

## Adding New Article Element

1.  `paragraph_id:integer` と `content` (`text`か `string`)を持ったモデルを定義する。
2. 他の記事要素（ `Ebisu::Body`とか）のActiveRecordの記述を複製する。（validationはなくても可）
3. （ `Ebisu::Paragraph::Body`とかを複製して）`Ebisu::Paragraph` を継承したクラスを作る。
4. `Ebisu::Paragraph::SUBCLASSES` にクラスを追加する
5. `Ebisu::Paragraph::***Decorator` を定義する
6. ebisu_admin/app/views/ebisu/paragraph以下に要素作成用のformを追加する

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
