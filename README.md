# Ebisu
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'ebisu'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install ebisu
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

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
